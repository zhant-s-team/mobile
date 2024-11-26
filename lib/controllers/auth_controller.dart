import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthController with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<void> login(String email, String password) async {
    final result = await _authService.login(email, password);

    if (result['success']) {
      // Login bem-sucedido
      notifyListeners();
    } else {
      throw Exception(result['message']);
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}

