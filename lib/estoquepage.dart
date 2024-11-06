import 'package:flutter/material.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'ESTOQUE',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
          child: IconButton(
            icon: const ImageIcon(
              AssetImage('assets/logo.png'),
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              _onItemTapped(0);
              Navigator.pushNamed(context, '/menupage');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                // Abre o drawer manualmente
                _scaffoldKey.currentState?.openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(32, 48, 0, 0),
          children: [
            const ListTile(
              title: Text(
                'INFO MOTOR',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              onTap: null,
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 56, 0, 0),
              title: const Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pushNamed(context, '/menupage');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Estoque',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/estoque');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Produção',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/producao');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Manutenção',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/manutencao');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Qualidade',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/qualidade');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Funcionários',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/funcionarios');
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.fromLTRB(15, 65, 0, 0),
              title: const Text(
                'Sair',
                style: TextStyle(
                    color: Color.fromARGB(192, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 33, 33),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Cadastrar Veículo",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 30, color: Colors.white),
                    onPressed: () {
                      // Ação ao clicar no botão "+"
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 33, 33),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20), // White text color
                      decoration: InputDecoration(
                        hintText: 'Pesquisar Veículo',
                        hintStyle:
                            TextStyle(color: Colors.white), // Hint text color
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30, // White icon color
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return EstoqueItemCard(
                    idVeiculo: "4SFD22",
                    modelo: "Sedan LX",
                    dataEntrada: "01/02/2024",
                    status: index % 2 == 0 ? "Em Estoque" : "Indisponível",
                    quantidade: index + 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EstoqueItemCard extends StatelessWidget {
  final String idVeiculo;
  final String modelo;
  final String dataEntrada;
  final String status;
  final int quantidade;

  const EstoqueItemCard({
    super.key,
    required this.idVeiculo,
    required this.modelo,
    required this.dataEntrada,
    required this.status,
    required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 33, 33, 33),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("ID do Veículo: $idVeiculo",
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 12)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: status == "Em Estoque"
                        ? Colors.green
                        : Colors.redAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              ],
            ),
            Text("Modelo: $modelo",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text("Data Entrada: $dataEntrada",
                style: const TextStyle(color: Colors.white70, fontSize: 10)),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$quantidade un",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white70),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white70),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
