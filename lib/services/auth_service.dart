import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  // Ajuste a URL conforme onde está rodando seu app:
  // Emulador Android: 'http://10.0.2.2:3000/auth'
  // Flutter Web ou iOS Simulator: 'http://localhost:3000/auth'
  static const String baseUrl = 'http://localhost:3000/auth';

  // Método de Cadastro
  Future<Map<String, dynamic>> register({
    required String nome,
    required String email,
    required String senha,
    String? telefone,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': nome,
        'email': email,
        'senha': senha,
        'telefone': telefone,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return {'success': true, 'message': data['message']};
    } else {
      return {'success': false, 'error': data['error'] ?? 'Erro no cadastro.'};
    }
  }

  // Método de Login
  Future<Map<String, dynamic>> login({
    required String email,
    required String senha,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'senha': senha,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {
        'success': true,
        'token': data['token'],
        'user': UserModel.fromJson(data['user']),
      };
    } else {
      return {'success': false, 'error': data['error'] ?? 'Credenciais inválidas.'};
    }
  }
}