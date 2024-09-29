import 'package:flutter/material.dart';
import '../models/app_model.dart';

class DataController with ChangeNotifier {
  final ApiService apiService;
  DataModel? _data;
  bool _loading = false;

  DataController(this.apiService);

  DataModel? get data => _data;
  bool get loading => _loading;

  Future<void> fetchData() async {
    _loading = true;
    notifyListeners();

    try {
      _data = await apiService.fetchData();
    } catch (e) {
      print(e);
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
