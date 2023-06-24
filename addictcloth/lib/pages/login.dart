import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';
import 'regis.dart';
import 'user_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool isPasswordHidden = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    var url = Uri.parse('https://websiteprojek.000webhostapp.com/api/login');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      // Login berhasil
      Map<String, dynamic> userData = jsonDecode(response.body)['data'];

      // Menyimpan data pengguna ke UserManager
      UserManager().id = userData['id'].toString();
      UserManager().name = userData['name'];
      UserManager().email = userData['email'];
      UserManager().phone_number = userData['phone_number'];
      UserManager().address = userData['address'];
      UserManager().api_token = userData['api_token'].toString();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(userData: userData),
        ),
      );
    } else {
      // Login gagal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Gagal'),
            content: const Text('Email atau password salah.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Hi, Ayo login dulu!",
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 30,
                      color: Color(0xFF300054),
                    ),
                  ),
                ),
                const Text(
                  "Ayo jadi member Addictive Clothing",
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    color: Color(0xFF300054),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/2861/2861401.png',
                  width: 160,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Icon(Icons.person, color: Color(0xFF300054)),
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
                        onPressed: () {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          if (email.isEmpty || password.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Peringatan'),
                                  content: const Text(
                                      'Email dan password harus diisi.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            loginUser(email, password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF300054),
                          minimumSize: const Size(200, 50),
                        ),
                        child: const Text(
                          "Login",
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
                              builder: (context) => const RegistrationPage(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        child: const Text(
                          'Yah belum punya akun? Daftar yuk',
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
    );
  }
}
