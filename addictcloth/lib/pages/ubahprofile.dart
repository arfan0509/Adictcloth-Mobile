import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_akhir/pages/home.dart';
import 'user_manager.dart';

class UbahProfilPage extends StatefulWidget {
  final String userId;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  const UbahProfilPage({
    Key? key,
    required this.userId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  }) : super(key: key);

  @override
  _UbahProfilPageState createState() => _UbahProfilPageState();
}

class _UbahProfilPageState extends State<UbahProfilPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
    _addressController = TextEditingController(text: widget.address);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _simpanPerubahan() async {
    try {
      final url = Uri.parse(
          'https://websiteprojek.000webhostapp.com/api/ubah/${widget.userId}');
      final response = await http.post(
        url,
        body: {
          'name': _nameController.text,
          'email': _emailController.text,
          'phone_number': _phoneNumberController.text,
          'address': _addressController.text,
        },
      );

      if (response.statusCode == 200) {
        UserManager().name = _nameController.text;
        UserManager().phone_number = _phoneNumberController.text;
        UserManager().address = _addressController.text;
        // Berhasil mengubah data
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Update Selesai'),
            content: const Text('Akun Anda telah berhasil diubah.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home(
                              userData: {},
                            )),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Gagal mengubah data
        print('Gagal memperbarui data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF300054),
        title: const Text('Ubah Profil'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama'),
            TextField(
              controller: _nameController,
            ),
            const SizedBox(height: 16),
            const Text('Email'),
            TextField(
              controller: _emailController,
            ),
            const SizedBox(height: 16),
            const Text('Nomor Telepon'),
            TextField(
              controller: _phoneNumberController,
            ),
            const SizedBox(height: 16),
            const Text('Alamat'),
            TextField(
              controller: _addressController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _simpanPerubahan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Simpan',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
