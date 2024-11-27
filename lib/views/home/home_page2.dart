import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../../models/entrega_model.dart'; // Importe o modelo EntregaModel

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  bool _isOverlayVisible = false;
  bool _isAccepted = false;
  late Future<List<EntregaModel>> entregas;

  @override
  void initState() {
    super.initState();
    entregas = fetchEntregas(); // Carrega as entregas da API
    _loadAcceptanceStatus();
    _loadUserData();
  }

Future<void> _loadUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final nome = prefs.getString('user_name') ?? 'Usuário';
  final email = prefs.getString('user_email') ?? 'Email não disponível';

  // Agora você pode usar as variáveis 'nome' e 'email' em sua interface
  print('Nome: $nome, Email: $email');
}
  Future<void> _loadAcceptanceStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isAccepted = prefs.getBool('isAccepted') ?? false;
    });
  }

  Future<void> _saveAcceptanceStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAccepted', status);
  }

  Future<List<EntregaModel>> fetchEntregas() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/entregas'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return entregaModelFromJson(response.body); // Parse os dados para EntregaModel
    } else {
      throw Exception('Erro ao carregar entregas: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              // Exibe as entregas no formato de Card
              FutureBuilder<List<EntregaModel>>(
                future: entregas,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (snapshot.hasData) {
                    final entregas = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: entregas.length,
                      itemBuilder: (context, index) {
                        final entrega = entregas[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Título da entrega
                                Text(
                                  '#${entrega.id} ${entrega.titulo}',
                                  style: const TextStyle(fontSize: 16, color: Colors.black),
                                ),

                                // Imagem da empresa
Center(
  child: ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.network(
      entrega.empresa.logo?.isNotEmpty == true
          ? entrega.empresa.logo!
          : 'https://site.fo.usp.br/wp-content/uploads/2022/10/sem-foto.jpg', // URL de fallback
      height: 94.0,
      width: 274.0,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child; // Retorna a imagem quando carregada
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          ); // Exibe um indicador de progresso enquanto a imagem carrega
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.error), // Exibe um ícone de erro se a imagem falhar ao carregar
        );
      },
    ),
  ),
),

                                // Informações adicionais da entrega
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Nome da empresa
                                    Text(
                                      'Empresa: ${entrega.empresa.nome}',
                                      style: const TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                    const SizedBox(height: 5.0),

                                    // Cidade de origem
                                    Text(
                                      'Cidade de origem: ${entrega.cidadeOrigem}',
                                      style: const TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                    const SizedBox(height: 5.0),

                                    // Cidade de destino
                                    Text(
                                      'Cidade destino: ${entrega.cidadeDestino}',
                                      style: const TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                    const SizedBox(height: 5.0),

                                    // Tipo do veículo
                                    Text(
                                      'Tipo do veículo: ${entrega.tipoVeiculo}',
                                      style: const TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),

                                // Botão de "Ver Mais"
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width: 140.0,
                                    height: 40.0,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _isOverlayVisible = true;
                                        });
                                      },
                                      icon: _isAccepted
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.green,
                                              size: 20.0,
                                            )
                                          : const SizedBox.shrink(),
                                      label: const Text(
                                        'Ver Mais',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('Nenhuma entrega encontrada.'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
