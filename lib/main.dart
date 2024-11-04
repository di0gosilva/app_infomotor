import 'package:flutter/material.dart';
import 'package:infomotor/loginpage.dart';
import 'package:infomotor/menupage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20)),
      routes: {
        '/': (context) => const LoginPage(),
        '/menupage': (context) => const MenuPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
