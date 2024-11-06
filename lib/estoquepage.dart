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

  bool _isExpanded = false;
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  final TextEditingController _idVeiculo = TextEditingController();
  final TextEditingController _modelo = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  final TextEditingController _dataEntrada = TextEditingController();

  List<Vehicle> veiculos = [];
  final String _selectedStatus = "Em estoque";

  void cadastrarVeiculo() {
    final String idVeiculo = _idVeiculo.text;
    final String modelo = _modelo.text;
    final int quantidade = int.tryParse(_quantidade.text) ?? 0;
    final String status = _selectedStatus;
    final String dataEntrada = _dataEntrada.text;

    if (idVeiculo.isNotEmpty && modelo.isNotEmpty && dataEntrada.isNotEmpty) {}
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
                    icon: Icon(
                      _isExpanded
                          ? Icons.close
                          : Icons.add, // Ícone muda para "close" ao expandir
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: _toggleExpand,
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _isExpanded
                  ? 310.0
                  : 0.0, // Expande para 250 quando _isExpanded é true
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 33, 33, 33),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SingleChildScrollView(
                // Adicionado SingleChildScrollView
                child: _isExpanded
                    ? Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Id. Veículo',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Modelo',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Qtd. Estoque',
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  items: <String>['Disponível', 'Indisponível']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {},
                                  decoration: InputDecoration(
                                    labelText: 'Status',
                                    labelStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(),
                                  ),
                                  dropdownColor:
                                      Color.fromARGB(255, 33, 33, 33),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Data Entrada',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 33, 33, 33),
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5), // Ajuste o valor para o desejado
                              ),
                            ),
                            child: const Text(
                              'Cadastrar',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    : Container(), // Conteúdo vazio quando o container está fechado
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'Pesquisar Veículo',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 160, 160, 160)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
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
                  return VehicleCard(
                    idVeiculo: "4SFD22",
                    modelo: "Sedan LX",
                    dataEntrada: "01/02/2024",
                    status: index % 2 == 0 ? "Em Estoque" : "Indisponível",
                    quantidade: index + 1,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class Vehicle {
  String idVeiculo;
  String modelo;
  int quantidade;
  String status;
  String dataEntrada;

  Vehicle({
    required this.idVeiculo,
    required this.modelo,
    required this.quantidade,
    required this.status,
    required this.dataEntrada,
  });
}

class VehicleCard extends StatelessWidget {
  final String idVeiculo;
  final String modelo;
  final String dataEntrada;
  final String status;
  final int quantidade;

  const VehicleCard({
    super.key,
    required this.idVeiculo,
    required this.modelo,
    required this.dataEntrada,
    required this.status,
    required this.quantidade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 33, 33),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID do Veículo: $idVeiculo',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: status == "Em Estoque" ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Modelo: $modelo',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$quantidade un',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white70),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white70),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Data Entrada: $dataEntrada',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class EstoquePage extends StatefulWidget {
//   const EstoquePage({super.key});

//   @override
//   State<EstoquePage> createState() => _EstoquePageState();
// }

// class _EstoquePageState extends State<EstoquePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool _isExpanded = false; // Variável para controlar o estado expandido
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _toggleExpand() {
//     setState(() {
//       _isExpanded = !_isExpanded;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 20, 20, 20),
//         title: const Text(
//           'ESTOQUE',
//           style: TextStyle(fontSize: 24, color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 33, 33, 33),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Cadastrar Veículo",
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _isExpanded
//                           ? Icons.close
//                           : Icons.add, // Ícone muda para "close" ao expandir
//                       size: 30,
//                       color: Colors.white,
//                     ),
//                     onPressed: _toggleExpand,
//                   ),
//                 ],
//               ),
//             ),
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 300),
//               height: _isExpanded
//                   ? 250.0
//                   : 0.0, // Expande para 250 quando _isExpanded é true
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 33, 33, 33),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: _isExpanded
//                   ? Column(
//                       children: [
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Id. Veículo',
//                             labelStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Modelo',
//                             labelStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   labelText: 'Qtd. Estoque',
//                                   labelStyle: TextStyle(color: Colors.white),
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: DropdownButtonFormField<String>(
//                                 items: <String>['Disponível', 'Indisponível']
//                                     .map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? newValue) {},
//                                 decoration: InputDecoration(
//                                   labelText: 'Status',
//                                   labelStyle: TextStyle(color: Colors.white),
//                                   border: OutlineInputBorder(),
//                                 ),
//                                 dropdownColor: Colors.black,
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Data Entrada',
//                             labelStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(),
//                           ),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Ação ao clicar no botão "Cadastrar"
//                           },
//                           child: const Text('Cadastrar'),
//                         ),
//                       ],
//                     )
//                   : Container(), // Conteúdo vazio quando o container está fechado
//             ),
//             const SizedBox(height: 32),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index) {
//                   return VehicleCard(
//                     idVeiculo: "4SFD22",
//                     modelo: "Sedan LX",
//                     dataEntrada: "01/02/2024",
//                     status: index % 2 == 0 ? "Em Estoque" : "Indisponível",
//                     quantidade: index + 1,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VehicleCard extends StatelessWidget {
//   final String idVeiculo;
//   final String modelo;
//   final String dataEntrada;
//   final String status;
//   final int quantidade;

//   const VehicleCard({
//     super.key,
//     required this.idVeiculo,
//     required this.modelo,
//     required this.dataEntrada,
//     required this.status,
//     required this.quantidade,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(12.0),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 33, 33, 33),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'ID do Veículo: $idVeiculo',
//                 style: const TextStyle(color: Colors.white70, fontSize: 12),
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: status == "Em Estoque" ? Colors.green : Colors.red,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   status,
//                   style: const TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Modelo: $modelo',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4.0),
//                   Text(
//                     'Data Entrada: $dataEntrada',
//                     style: const TextStyle(color: Colors.white70, fontSize: 12),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit, color: Colors.white70),
//                     onPressed: () {},
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.white70),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 8.0),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 '$quantidade un',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
