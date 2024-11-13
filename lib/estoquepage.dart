// Autor: Diogo da Silva
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'postgres.dart';

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final db = DatabaseFile();

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

  FocusNode focusNode = FocusNode();

  void removerFocus() {
    FocusScope.of(context).unfocus();
  }

  final TextEditingController _idVeiculo = TextEditingController();
  final TextEditingController _modelo = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();
  final TextEditingController _dataEntrada = TextEditingController();
  final TextEditingController _pesquisa = TextEditingController();

  List<Vehicle> veiculos = [];
  List<Vehicle> veiculosFiltrados = [];
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    iniciaDatabase().then((_) => fetchVeiculos());
    _selectedStatus = "Em estoque";
  }

  Future<void> iniciaDatabase() async {
    await db.connectToDatabase();
  }

  void cadastrarVeiculo() {
    final String idVeiculo = _idVeiculo.text;
    final String modelo = _modelo.text;
    final int quantidade = int.tryParse(_quantidade.text) ?? 0;
    final String status = _selectedStatus ?? "Em estoque";
    final DateTime dataEntrada =
        DateFormat("dd/MM/yyyy").parse(_dataEntrada.text);

    if (idVeiculo.isNotEmpty && modelo.isNotEmpty && quantidade >= 0) {
      createVeiculo(idVeiculo, modelo, quantidade, status, dataEntrada);

      setState(() {
        veiculos.add(Vehicle(
            idVeiculo: idVeiculo,
            modelo: modelo,
            quantidade: quantidade,
            status: status,
            dataEntrada: dataEntrada.toIso8601String()));
      });

      veiculosFiltrados = List.from(veiculos);

      _idVeiculo.clear();
      _modelo.clear();
      _quantidade.clear();
      _dataEntrada.clear();
      _selectedStatus = "Em estoque";

      _toggleExpand();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Por favor, preencha todos os campos.")));
    }
  }

  Future<void> fetchVeiculos() async {
    try {
      final veiculosData = await getVeiculos();
      setState(() {
        veiculos = veiculosData; // Atualize a lista original
        veiculosFiltrados = List.from(veiculos); // Copie para a lista filtrada
      });
    } catch (e, stackTrace) {
      print("Erro ao buscar veículos: $e");
      print("Stack trace: $stackTrace");
    }
  }

  Future<List<Vehicle>> getVeiculos() async {
    try {
      final List<Map<String, Map<String, dynamic>>> results =
          await db.readData('veiculo');

      // Imprimir os resultados do banco
      print("Resultado do banco de dados: $results");

      return results.map((row) {
        return Vehicle.fromMap(row['veiculo']!);
      }).toList();
    } catch (e) {
      print("Erro ao recuperar os veículos: $e");
      return [];
    }
  }

  void createVeiculo(String idVeiculo, String modelo, int quantidade,
      String status, DateTime dataEntrada) async {
    await db.createData('veiculo', {
      'id_veiculo': idVeiculo,
      'modelo': modelo,
      'quantidade': quantidade,
      'status': status,
      'data_entrada': dataEntrada,
    });
  }

  void removerVeiculo(int index) async {
    final veiculo = veiculos[index];
    final idVeiculo = veiculo.idVeiculo;
    try {
      await db.deleteData(
          'veiculo', 'id_veiculo = @id_veiculo', {'id_veiculo': idVeiculo});

      setState(() {
        veiculos.removeAt(index);
        print("Veículo removido. Veículos restantes: ${veiculos.length}");
        veiculosFiltrados = List.from(veiculos);
        print(
            "Veículo removido. Veículos restantes: ${veiculosFiltrados.length}");
      });
    } catch (e) {
      print("Erro ao excluir veículo do banco de dados: ${e.toString()}");
    }
  }

  void pesquisarVeiculo(String item) {
    setState(() {
      if (item.isEmpty) {
        veiculosFiltrados = List.from(veiculos);
      } else {
        veiculosFiltrados = veiculos
            .where((veiculo) =>
                veiculo.modelo.toLowerCase().contains(item.toLowerCase()))
            .toList();
      }
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
      body: GestureDetector(
        onTap: removerFocus,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card Expansível - Cadastrar Veículo
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
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
                    ? 365.0
                    : 0.0, // Expande para 250 quando _isExpanded é true
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 33, 33),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  child: _isExpanded
                      ? Column(
                          children: [
                            // Campo - Id Veículo
                            TextField(
                              controller: _idVeiculo,
                              decoration: const InputDecoration(
                                labelText: 'Id. Veículo',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            // Campo - Modelo
                            TextField(
                              controller: _modelo,
                              decoration: const InputDecoration(
                                labelText: 'Modelo',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  // Campo - Quantidade
                                  child: TextField(
                                    controller: _quantidade,
                                    decoration: const InputDecoration(
                                      labelText: 'Quantidade',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(),
                                    ),
                                    style: const TextStyle(color: Colors.white),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  // Campo - Status
                                  child: DropdownButtonFormField<String>(
                                    value: _selectedStatus,
                                    items: <String>[
                                      "Em estoque",
                                      "Indisponível"
                                    ].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedStatus = newValue!;
                                        print(
                                            "Selected Status: $_selectedStatus");
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Status',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      border: OutlineInputBorder(),
                                    ),
                                    dropdownColor:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Campo - Data Entrada
                            TextField(
                              controller: _dataEntrada,
                              decoration: const InputDecoration(
                                labelText: 'Data Entrada',
                                labelStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(),
                              ),
                              style: const TextStyle(color: Colors.white),
                              readOnly: true,
                              onTap: () {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) async {
                                  FocusScope.of(context).unfocus();
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('dd/MM/yyyy')
                                            .format(pickedDate);
                                    setState(() {
                                      _dataEntrada.text = formattedDate;
                                    });
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            // Button - Cadastrar
                            ElevatedButton(
                              onPressed: cadastrarVeiculo,
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      : Container(), // Conteúdo vazio quando o container está fechado
                ),
              ),
              const SizedBox(height: 32),
              // Card Pesquisa - Pesquisar Veículo
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 33, 33, 33),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _pesquisa,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                          hintText: 'Pesquisar Veículo',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 160, 160, 160)),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          pesquisarVeiculo(value);
                        },
                      ),
                    ),
                    const Padding(
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
              // Lista de Cards - Veículos
              Expanded(
                child: veiculosFiltrados.isEmpty
                    ? const Center(child: Text("Nenhum veículo encontrado"))
                    : ListView.builder(
                        itemCount: veiculosFiltrados.length,
                        itemBuilder: (context, index) {
                          final veiculo = veiculosFiltrados[index];
                          return VehicleCard(
                            idVeiculo: veiculo.idVeiculo,
                            modelo: veiculo.modelo,
                            dataEntrada: veiculo.dataEntrada,
                            status: veiculo.status,
                            quantidade: veiculo.quantidade,
                            onDelete: () {
                              final originalIndex = veiculos.indexOf(veiculo);
                              removerVeiculo(originalIndex);
                            },
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

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    DateTime data = DateTime.parse(map['data_entrada'].toString());
    return Vehicle(
      idVeiculo: map['id_veiculo'].toString(),
      modelo: map['modelo'] ?? '',
      quantidade: (map['quantidade'] is int)
          ? map['quantidade']
          : int.tryParse(map['quantidade'].toString()) ?? 0,
      status: map['status'] ?? '',
      dataEntrada: DateFormat('dd/MM/yyyy').format(data), // Formate aqui
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String idVeiculo;
  final String modelo;
  final String dataEntrada;
  final String status;
  final int quantidade;
  final VoidCallback onDelete;

  const VehicleCard({
    super.key,
    required this.idVeiculo,
    required this.modelo,
    required this.dataEntrada,
    required this.status,
    required this.quantidade,
    required this.onDelete,
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
          // 1° Linha - Id do Veículo + Banner "Em estoque / Insdisponível"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ID do Veículo: $idVeiculo',
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: quantidade > 0
                      ? const Color.fromRGBO(76, 175, 80, 1)
                      : const Color.fromRGBO(244, 67, 54, 1),
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
          // 2° Linha - Modelo + Qtd + Botões Edit + Delete
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
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // 3° Linha - Data de Entrada
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
