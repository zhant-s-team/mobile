import 'package:flutter/material.dart';

import '../../models/entrega_model.dart';
import '../../services/api_service.dart';

class EntregasPage extends StatefulWidget {
  const EntregasPage({super.key});

  @override
  _EntregasPageState createState() => _EntregasPageState();
}

class _EntregasPageState extends State<EntregasPage> {
  late Future<List<EntregaModel>> entregas;

  @override
  void initState() {
    super.initState();
    entregas = ApiService().fetchEntregas();  // Chama o ApiService para obter as entregas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregas'),
      ),
      body: FutureBuilder<List<EntregaModel>>(
        future: entregas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final entregas = snapshot.data!;
            return ListView.builder(
              itemCount: entregas.length,
              itemBuilder: (context, index) {
                final entrega = entregas[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(entrega.titulo),
                    subtitle: Text('${entrega.cidadeOrigem} ➔ ${entrega.cidadeDestino}'),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Status: ${entrega.status}'),
                        Text('Percurso: ${entrega.percurso} km'),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(entrega.titulo),
                          content: Text(
                            'Empresa: ${entrega.empresa.nome}\n'
                            'Usuário: ${entrega.user.name}\n'
                            'Carga: ${entrega.carga}\n'
                            'Veículo: ${entrega.tipoVeiculo}\n'
                            'Status: ${entrega.status}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Fechar'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Nenhuma entrega encontrada.'));
          }
        },
      ),
    );
  }
}
