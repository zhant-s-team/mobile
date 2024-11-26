
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/entrega_model.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<List<EntregaModel>> fetchEntregas() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/entregas'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // Convertendo cada item do JSON em um objeto EntregaModel
        List<EntregaModel> entregas = (jsonResponse as List)
            .map((data) => EntregaModel.fromJson(data))
            .toList();
        return entregas;
      } else {
        throw Exception('Erro ao acessar entregas: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }

}
