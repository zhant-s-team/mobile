import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/entrega_model.dart';
import '../../services/api_service.dart';

class EntregasFinalizadas extends StatefulWidget {
  const EntregasFinalizadas({super.key});

  @override
  _EntregasFinalizadasState createState() => _EntregasFinalizadasState();
}

class _EntregasFinalizadasState extends State<EntregasFinalizadas> {
  late Future<List<EntregaModel>> entregas;
  int? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id');
    setState(() {
      userId = id;
      // Chama o ApiService para obter as entregas apenas para o userId carregado
      if (userId != null) {
        entregas = ApiService().fetchEntregas(); // Busca todas as entregas
      }
    });
  }

  Future<void> _concluirEntrega(int entregaId) async {
    try {
      await ApiService().concluirEntrega(entregaId); // Método para concluir a entrega
      // Atualiza o estado para refletir a conclusão da entrega
      setState(() {
        entregas = ApiService().fetchEntregas(); // Recarrega as entregas
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entrega concluída com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao concluir entrega: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregas Concluídas'),
      ),
      body: FutureBuilder<List<EntregaModel>>(
        future: entregas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Filtra as entregas onde 'status' é 'D' (concluídas) e 'accept_by' é igual ao 'userId'
            final entregasFiltradas = snapshot.data!
                .where((entrega) => entrega.status == 'C' && entrega.acceptBy == userId)
                .toList();

            if (entregasFiltradas.isEmpty) {
              return const Center(child: Text('Nenhuma entrega concluída encontrada.'));
            }

            return ListView.builder(
              itemCount: entregasFiltradas.length,
              itemBuilder: (context, index) {
                final entrega = entregasFiltradas[index];
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
                            'Descrição: ${entrega.descricao}\n' // Exibe a descrição
                            'Status: ${entrega.status}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Fecha o diálogo
                              },
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
            return const Center(child: Text('Nenhuma entrega concluída encontrada.'));
          }
        },
      ),
    );
  }
}
