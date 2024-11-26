import 'package:flutter/material.dart';
import 'package:gestao/services/api_service.dart';

import '../models/empresa_model.dart';
import '../models/entrega_model.dart';

class EntregaController with ChangeNotifier {
  final ApiService apiService;
  List<EntregaModel>? _entregas;
  bool _loading = false;

  EntregaController(this.apiService);

  List<EntregaModel>? get entregas => _entregas;
  bool get loading => _loading;

  Future<void> fetchEntregas() async {
    _loading = true;
    notifyListeners();

    try {
      _entregas = (await apiService.fetchEntregas()) as List<EntregaModel>?;
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
