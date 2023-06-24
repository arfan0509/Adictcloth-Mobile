import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool rememberMe = false;
  bool isPasswordHidden = true;

  Future<void> _registerUser() async {
    // Mendapatkan data dari TextField
    String name = _nameController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;
    String address = _addressController.text;
    String password = _passwordController.text;

    var url = Uri.parse('https://websiteprojek.000webhostapp.com/api/register');

    try {
      var response = await http.post(url, body: {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'password': password,
      });

      if (response.statusCode == 201) {
        // Registrasi berhasil
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Registrasi Berhasil'),
            content: const Text('Akun Anda telah berhasil didaftarkan.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Registrasi gagal
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Registrasi Gagal'),
            content: const Text(
                'Mohon cek kembali email anda dan pastikan password anda berjumlah 8 digit.'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      // Terjadi kesalahan saat melakukan permintaan
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Terjadi Kesalahan'),
          content: const Text('Terjadi kesalahan saat melakukan permintaan.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 5),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Ayo daftar sekarang!",
                      style: TextStyle(
                        fontFamily: 'PoppinsBold',
                        fontSize: 30,
                        color: Color(0xFF300054),
                      ),
                    ),
                  ),
                  const Text(
                    "Isi datanya dengan benar ya",
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      color: Color(0xFF300054),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/2329/2329224.png',
                    width: 160,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(Icons.email, color: Color(0xFF300054)),
                              SizedBox(width: 5),
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF300054),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _emailController,
                                style: const TextStyle(
                                  color: Color(0xFF300054),
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(Icons.person, color: Color(0xFF300054)),
                              SizedBox(width: 5),
                              Text(
                                "Nama Lengkap",
                                style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF300054),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                  color: Color(0xFF300054),
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(Icons.phone, color: Color(0xFF300054)),
                              SizedBox(width: 5),
                              Text(
                                "Nomor Telepon",
                                style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF300054),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _phoneNumberController,
                                style: const TextStyle(
                                  color: Color(0xFF300054),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(Icons.location_on, color: Color(0xFF300054)),
                              SizedBox(width: 5),
                              Text(
                                "Alamat",
                                style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF300054),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _addressController,
                                style: const TextStyle(
                                  color: Color(0xFF300054),
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2.0),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              Icon(Icons.lock, color: Color(0xFF300054)),
                              SizedBox(width: 5),
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF300054),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _passwordController,
                                obscureText: isPasswordHidden,
                                style: const TextStyle(
                                  color: Color(0xFF300054),
                                ),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(width: 2.0),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isPasswordHidden = !isPasswordHidden;
                                      });
                                    },
                                    icon: Icon(
                                      isPasswordHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xFF300054),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 35)),
                        ElevatedButton(
                          onPressed: () async {
                            await _registerUser();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF300054),
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              fontFamily: 'PoppinsRegular',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()),
                            );
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          child: const Text(
                            'Udah punya akun? Sini login',
                            style: TextStyle(
                              fontFamily: 'PoppinsRegular',
                              color: Color(0xFF300054),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
