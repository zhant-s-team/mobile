import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://127.0.0.1:8000/api';

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
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);

        // Armazenando o nome e o email do usuário
        await prefs.setString('user_name', data['user']['name']);
        await prefs.setString('user_email', data['user']['email']);
        await prefs.setInt('user_id', data['user']['id']);

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

    // Depuração da resposta
    print('Resposta do servidor: ${response.body}');

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      
      // Verifique a estrutura da resposta no Flutter
      if (data['data'] != null && data['data']['token'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['data']['token']);
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
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        final response = await http.post(
          Uri.parse('$baseUrl/logout'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          // Remove o token após o logout
          await prefs.remove('token');
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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null;
  }

  // Recupera o token armazenado
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
