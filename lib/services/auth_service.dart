import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000';  // URL da sua API
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Realiza o login
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Armazenando o token
        await _secureStorage.write(key: 'token', value: data['token']);
        return {'success': true, 'message': 'Login realizado com sucesso', 'data': data};
      } else {
        return {'success': false, 'message': 'Credenciais inválidas'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erro ao tentar se conectar'};
    }
  }

  // Realiza o registro
  Future<Map<String, dynamic>> register(String name, String email, String password, String passwordConfirmation) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        // Armazenando o token
        await _secureStorage.write(key: 'token', value: data['token']);
        return {'success': true, 'message': 'Registro realizado com sucesso', 'data': data};
      } else {
        return {'success': false, 'message': 'Erro ao registrar'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erro ao tentar se conectar'};
    }
  }

  // Realiza o logout
  Future<void> logout() async {
    try {
      final token = await _secureStorage.read(key: 'token');
      if (token != null) {
        await http.post(
          Uri.parse('$baseUrl/logout'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );
        // Remove o token após o logout
        await _secureStorage.delete(key: 'token');
      }
    } catch (e) {
      // Tratar o erro aqui, se necessário
    }
  }

  // Verifica se o usuário está autenticado (checa o token)
  Future<bool> isAuthenticated() async {
    final token = await _secureStorage.read(key: 'token');
    return token != null;
  }

  // Recupera o token armazenado
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }
}
