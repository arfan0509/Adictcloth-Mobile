import 'package:flutter/material.dart';
import 'package:projek_akhir/pages/login.dart';
import 'splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const LoginPage(),
      },
    );
  }
}
