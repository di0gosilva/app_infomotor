import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0), // Ajusta o padding à esquerda
              child: IconButton(
                icon: ImageIcon(
                  AssetImage('assets/logo.png'),
                  color: Colors.white,
                  size: 28, // ajuste o tamanho conforme necessário
                ),
                onPressed: null,
              ),
            ),
            Text(
              "INFO MOTOR",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.only(right: 0), // Ajusta o padding à direita
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
