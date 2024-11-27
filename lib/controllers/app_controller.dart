import 'package:flutter/material.dart';
import 'package:gestao/services/api_service.dart';
import 'package:http/http.dart' as http;
import '../models/entrega_model.dart';

class EntregaController with ChangeNotifier {
  final ApiService apiService;
  List<EntregaModel>? _entregas;
  bool _loading = false;

  EntregaController(this.apiService);

  List<EntregaModel>? get entregas => _entregas;
  bool get loading => _loading;


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
}
