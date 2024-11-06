import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //appBar: AppBar(
      // automaticallyImplyLeading: false,
      // backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      // centerTitle: true,
      // title: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     const Padding(
      //       padding: EdgeInsets.only(left: 0), // Ajusta o padding à esquerda
      //       child: IconButton(
      //         icon: ImageIcon(
      //           AssetImage('assets/logo.png'),
      //           color: Colors.white,
      //           size: 28, // ajuste o tamanho conforme necessário
      //         ),
      //         onPressed: null,
      //       ),
      //     ),
      //     const Text(
      //       "INFO MOTOR",
      //       style: TextStyle(color: Colors.white, fontSize: 24),
      //     ),
      //     Padding(
      //       padding:
      //           const EdgeInsets.only(right: 0), // Ajusta o padding à direita
      //       child: IconButton(
      //         icon: const Icon(
      //           Icons.menu,
      //           color: Colors.white,
      //           size: 30,
      //         ),
      //         onPressed: () {
      //           //.openEndDrawer(); .openDrawer();
      //           _scaffoldKey.currentState?.openEndDrawer();
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      // endDrawer: Drawer(
      //   backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      //   child: ListView(
      //     padding: const EdgeInsets.fromLTRB(32, 48, 0, 0),
      //     children: [
      //       const ListTile(
      //         title: Text(
      //           'INFO MOTOR',
      //           style: TextStyle(color: Colors.white, fontSize: 24),
      //         ),
      //         onTap: null,
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 56, 0, 0),
      //         title: const Text(
      //           'Home',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 0,
      //         onTap: () {
      //           _onItemTapped(0);
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //         title: const Text(
      //           'Estoque',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           _onItemTapped(1);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //         title: const Text(
      //           'Produção',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           _onItemTapped(1);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //         title: const Text(
      //           'Manutenção',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           _onItemTapped(1);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //         title: const Text(
      //           'Qualidade',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           _onItemTapped(1);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      //         title: const Text(
      //           'Funcionários',
      //           style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 1,
      //         onTap: () {
      //           _onItemTapped(1);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //       ListTile(
      //         contentPadding: const EdgeInsets.fromLTRB(15, 65, 0, 0),
      //         title: const Text(
      //           'Sair',
      //           style: TextStyle(
      //               color: Color.fromARGB(192, 255, 255, 255),
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         selected: _selectedIndex == 2,
      //         onTap: () {
      //           _onItemTapped(2);
      //           Navigator.pushNamed(context, '/');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        title: const Text(
          'INFO MOTOR',
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
                  size: 95,
                ),
                label: 'Estoque',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/estoque');
                },
              ),
              const SizedBox(height: 32),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/producao.png'),
                  color: Colors.white,
                  size: 95,
                ),
                label: 'Produção',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/producao');
                },
              ),
              const SizedBox(height: 32),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/manutencao.png'),
                  color: Colors.white,
                  size: 95,
                ),
                label: 'Manutenção',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/manutencao');
                },
              ),
              const SizedBox(height: 32),
              SectorCard(
                icon: const ImageIcon(
                  AssetImage('assets/qualidade.png'),
                  color: Colors.white,
                  size: 95,
                ),
                label: 'Qualidade',
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pushNamed(context, '/qualidade');
                },
              ),
              const SizedBox(height: 32),
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

  const SectorCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[850],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 16),
              icon, // Agora o ícone pode ser qualquer widget
              const SizedBox(width: 48),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
