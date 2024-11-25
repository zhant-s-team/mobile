import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Realiza o login
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
      
      // Verificar se o servidor retornou a informação sobre CNH
      if (data['user'] != null && data['user']['cnh'] == null) {
        return {'success': false, 'message': 'Usuario não é motorista'};
      }

      if (data['token'] != null) {
        // Armazenando o token
        await _secureStorage.write(key: 'token', value: data['token']);
        return {'success': true, 'message': 'Login realizado com sucesso', 'data': data};
      } else {
        return {'success': false, 'message': 'Token não recebido'};
      }
    } else {
      final data = jsonDecode(response.body);
      return {'success': false, 'message': data['message'] ?? 'Credenciais inválidas'};
    }
  } catch (e) {
    return {'success': false, 'message': 'Erro ao tentar se conectar: $e'};
  }
}


  // Realiza o registro
  Future<Map<String, dynamic>> register(String name, String email, String password, String passwordConfirmation, String cnh) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
          'cnh': cnh,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (data['token'] != null) {
          // Armazenando o token
          await _secureStorage.write(key: 'token', value: data['token']);
          return {'success': true, 'message': 'Registro realizado com sucesso', 'data': data};
        } else {
          return {'success': false, 'message': 'Token não recebido após o registro'};
        }
      } else {
        return {'success': false, 'message': 'Erro ao registrar: ${response.body}'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erro ao tentar se conectar: $e'};
    }
  }

  // Realiza o logout
  Future<Map<String, dynamic>> logout() async {
    try {
      final token = await _secureStorage.read(key: 'token');
      if (token != null) {
        final response = await http.post(
          Uri.parse('$baseUrl/logout'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          // Remove o token após o logout
          await _secureStorage.delete(key: 'token');
          return {'success': true, 'message': 'Logout realizado com sucesso'};
        } else {
          return {'success': false, 'message': 'Erro ao realizar logout: ${response.body}'};
        }
      } else {
        return {'success': false, 'message': 'Nenhum token encontrado'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Erro ao tentar se conectar: $e'};
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
