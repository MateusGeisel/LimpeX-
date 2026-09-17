import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool isLoading = false;
  String? errorMessage;
  UserModel? currentUser;
  String? token;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<bool> register(String nome, String email, String senha, String? telefone) async {
    _setLoading(true);
    errorMessage = null;

    final result = await _authService.register(
      nome: nome,
      email: email,
      senha: senha,
      telefone: telefone,
    );

    _setLoading(false);

    if (result['success']) {
      return true;
    } else {
      errorMessage = result['error'];
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(String email, String senha) async {
    _setLoading(true);
    errorMessage = null;

    final result = await _authService.login(email: email, senha: senha);

    _setLoading(false);

    if (result['success']) {
      currentUser = result['user'];
      token = result['token'];
      notifyListeners();
      return true;
    } else {
      errorMessage = result['error'];
      notifyListeners();
      return false;
    }
  }
}