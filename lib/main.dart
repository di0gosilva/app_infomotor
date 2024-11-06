import 'package:flutter/material.dart';
import 'package:infomotor/estoquepage.dart';
import 'package:infomotor/funcionariospage.dart';
import 'package:infomotor/loginpage.dart';
import 'package:infomotor/manutencaopage.dart';
import 'package:infomotor/menupage.dart';
import 'package:infomotor/producaopage.dart';
import 'package:infomotor/qualidadepage.dart';

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
        '/estoque': (context) => const EstoquePage(),
        '/producao': (context) => const ProducaoPage(),
        '/manutencao': (context) => const ManutencaoPage(),
        '/qualidade': (context) => const QualidadePage(),
        '/funcionarios': (context) => const FuncionariosPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
