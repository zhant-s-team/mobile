import 'package:gestao/models/app_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  Future<DataModel> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 10)); // Timeout de 10 segundos

      if (response.statusCode == 200) {
        return DataModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Erro ao acessar banco de dados: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Erro de conexão: $e');
    }
  }
}
