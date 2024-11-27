
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

}
