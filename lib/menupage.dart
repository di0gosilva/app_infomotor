// Autor: Diogo da Silva
import 'package:flutter/material.dart';
import 'postgres.dart';
import 'estoquepage.dart';
import 'manutencaopage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final db = DatabaseFile();
  List<Vehicle> veiculos = [];

  @override
  void initState() {
    super.initState();
    iniciaDatabase().then((_) => fetchVeiculos());
  }

  Future<void> iniciaDatabase() async {
    await db.connectToDatabase();
  }

  Future<void> fetchVeiculos() async {
    try {
      final veiculosData = await db.readData('veiculo');
      setState(() {
        veiculos = veiculosData.map<Vehicle>((veiculoMap) {
          return Vehicle.fromMap(veiculoMap['veiculo']!);
        }).toList();
      });
    } catch (e) {
      print("Erro ao carregar veículos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'INFO MOTOR',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
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
              // Ação ao clicar no ícone de logo, se necessário
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
          padding: const EdgeInsets.fromLTRB(32, 60, 0, 0),
          children: [
            const ListTile(
              title: Text(
                'INFO MOTOR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
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
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              title: const Text(
                'Sobre Nós',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pushNamed(context, '/sobrenos');
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/estoque.png'),
                  color: Colors.white,
                  size: 40,
                ),
                label: 'ESTOQUE',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/estoque');
                },
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          width: 1.5),
                      columnWidths: const {
                        0: FixedColumnWidth(100), // Definindo largura da coluna
                        1: FixedColumnWidth(132),
                        2: FixedColumnWidth(116),
                      },
                      children: [
                        // Cabeçalho da tabela
                        TableRow(
                          children: [
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('ID Veículo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Modelo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Quantidade',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        // Aqui são inseridos os dados dos veículos
                        for (var veiculo in veiculos
                            .where((veiculo) => veiculo.quantidade <= 3)
                            .toList()
                          ..sort(
                              (a, b) => a.quantidade.compareTo(b.quantidade)))
                          TableRow(
                            children: [
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(56, 0, 0, 0), */
                                child: Text(veiculo.idVeiculo,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(35, 0, 0, 0), */
                                child: Text(veiculo.modelo,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(54, 0, 0, 0), */
                                child: Text(veiculo.quantidade.toString(),
                                    style: TextStyle(
                                        color: veiculo.quantidade == 0
                                            ? const Color.fromRGBO(
                                                244, 67, 54, 1)
                                            : Colors.white)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/producao.png'),
                  color: Colors.white,
                  size: 40,
                ),
                label: 'PRODUÇÃO',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/producao');
                },
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          width: 1.5),
                      columnWidths: const {
                        0: FixedColumnWidth(100), // Definindo largura da coluna
                        1: FixedColumnWidth(116),
                        2: FixedColumnWidth(132),
                      },
                      children: [
                        // Cabeçalho da tabela
                        TableRow(
                          children: [
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('ID Veículo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Modelo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Mais Solicitados',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        // Aqui são inseridos os dados dos veículos
                        for (var veiculo in veiculos
                            .where((veiculo) => veiculo.quantidade >= 5)
                            .toList()
                          ..sort(
                              (a, b) => a.quantidade.compareTo(b.quantidade)))
                          TableRow(
                            children: [
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(56, 0, 0, 0), */
                                child: Text(veiculo.idVeiculo,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(35, 0, 0, 0), */
                                child: Text(veiculo.modelo,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(54, 0, 0, 0), */
                                child: Text(veiculo.quantidade.toString(),
                                    style: TextStyle(
                                        color: veiculo.quantidade == 0
                                            ? const Color.fromRGBO(
                                                244, 67, 54, 1)
                                            : Colors.white)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/manutencao.png'),
                  color: Colors.white,
                  size: 35,
                ),
                label: 'MANUTENÇÃO',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/manutencao');
                },
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          width: 1.5),
                      columnWidths: const {
                        0: FixedColumnWidth(70), // Definindo largura da coluna
                        1: FixedColumnWidth(170),
                        2: FixedColumnWidth(108),
                      },
                      children: [
                        // Cabeçalho da tabela
                        TableRow(
                          children: [
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('ID',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Nome',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              /* padding: const EdgeInsets.fromLTRB(10, 0, 0, 0), */
                              child: const Text('Horas Func.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                        // Aqui são inseridos os dados dos veículos
                        for (var braco in bracosRoboticos)
                          TableRow(
                            children: [
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(56, 0, 0, 0), */
                                child: Text(braco.id,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(35, 0, 0, 0), */
                                child: Text(braco.title,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                /* padding: const EdgeInsets.fromLTRB(54, 0, 0, 0), */
                                child: Text(braco.hours.toString(),
                                    style: TextStyle(
                                        color: braco.hours == 0
                                            ? const Color.fromRGBO(
                                                244, 67, 54, 1)
                                            : Colors.white)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class SectorCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final Widget child;

  const SectorCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 33, 33, 33),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* const SizedBox(width: 16), */
                  icon, // Agora o ícone pode ser qualquer widget
                  const SizedBox(width: 30),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
