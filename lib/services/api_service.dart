
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/entrega_model.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

/*  final response = await http.get(
    Uri.parse('http://127.0.0.1:8000/api/entregas'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',  // Passa o token aqui
    },
  );*/
  Future<List<EntregaModel>> fetchEntregas() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token') ?? '';
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
    Future<List<EntregaModel>> fetchEntregasFiltradas(int userId) async {
    // Obtenha as entregas da API ou do backend
    final entregas = await fetchEntregas();

    // Filtre as entregas pelo status e pelo usuário
    return entregas.where((entrega) => entrega.status == 'A' && entrega.acceptBy == userId).toList();
  }

  // Função para aceitar uma entrega
  Future<void> aceitarEntrega(int entregaId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      Uri.parse('$baseUrl/entregas/$entregaId/aceitar'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Passa o token aqui
      },
    );

    if (response.statusCode == 200) {
      print('Entrega aceita com sucesso!');
    } else {
      throw Exception('Erro ao aceitar entrega: ${response.statusCode}');
    }
  }

  // Função para concluir uma entrega
  Future<void> concluirEntrega(int entregaId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.post(
      Uri.parse('$baseUrl/entregas/$entregaId/concluir'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token', // Passa o token aqui
      },
    );

    if (response.statusCode == 200) {
      print('Entrega concluída com sucesso!');
    } else {
      throw Exception('Erro ao concluir entrega: ${response.statusCode}');
    }
  }

// Função para cancelar uma entrega
Future<void> cancelarEntrega(int entregaId) async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? ''; // Recupera o token de autenticação

  final response = await http.post(
    Uri.parse('$baseUrl/entregas/$entregaId/cancelar'), // Rota para cancelar a entrega
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token', // Passa o token no header de autorização
    },
  );

  if (response.statusCode == 200) {
    print('Entrega cancelada com sucesso!');
  } else {
    throw Exception('Erro ao cancelar entrega: ${response.statusCode}');
  }
}

}
