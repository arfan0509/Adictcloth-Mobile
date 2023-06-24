import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projek_akhir/pages/splash.dart';
import 'dart:convert';

import 'package:projek_akhir/pages/ubahprofile.dart';

class UserProfilePage extends StatefulWidget {
  final String userId;

  const UserProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState(userId);
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? _id;
  String? _name;
  String? _email;
  String? _phoneNumber;
  String? _address;

  _UserProfilePageState(this._id);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final url = Uri.parse('https://websiteprojek.000webhostapp.com/api/users/${widget.userId}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);

      setState(() {
        _id = userData['id'].toString();
        _name = userData['name'];
        _email = userData['email'];
        _phoneNumber = userData['phone_number'];
        _address = userData['address'];
      });
    } else {
      // Handle error ketika gagal memuat data
      print('Gagal memuat data pengguna');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF300054),
        title: const Text('Profil Pengguna'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xFF300054),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Text('Nama: $_name'),
            const SizedBox(height: 16),
            Text('Email: $_email'),
            const SizedBox(height: 16),
            Text('Nomor Telepon: $_phoneNumber'),
            const SizedBox(height: 16),
            Text('Alamat: $_address'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Logout',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UbahProfilPage(
                              userId: _id!,
                              email: _email!,
                              address: _address!,
                              name: _name!,
                              phoneNumber: _phoneNumber!)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Ubah Data',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
