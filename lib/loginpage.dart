// Autor: Vinicius Coelho
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String result = "";

  String userLogin = "admin";
  String passwordLogin = "12345";

  void removerFocus() {
    FocusScope.of(context).unfocus();
  }

  void validarLogin() {
    setState(() {
      if (user.text == userLogin && password.text == passwordLogin) {
        Navigator.pushNamed(context, '/menupage');
      } else {
        result = "Erro! Suas credenciais estão incorretas.";
      }

      user.text = "";
      password.text = "";
    });
  }

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
                  size: 26, // ajuste o tamanho conforme necessário
                ),
                onPressed: null,
              ),
            ),
            Text(
              "INFO MOTOR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
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
      body: GestureDetector(
        onTap: removerFocus,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Icon(
                                Icons.person,
                                size: 150,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: user,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Insira um usuário válido!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Matrícula",
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 33, 33, 33),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              TextFormField(
                                controller: password,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Insira uma senha válida!";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Senha",
                                  labelStyle: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  filled: true,
                                  fillColor:
                                      const Color.fromARGB(255, 33, 33, 33),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    validarLogin();
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    fixedSize: const Size(0, 60),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const Text(
                                  "Entrar",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                result,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
