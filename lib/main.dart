import 'package:flutter/material.dart';
import 'services/auth_service.dart';
import 'views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LimpeX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
    );
  }
}
void testarLogin() async {
  final authService = AuthService();
  
  // Tenta realizar o cadastro via App
  var resRegister = await authService.register(
    nome: 'Mateus App',
    email: 'mateus.app@limpex.com',
    senha: 'senhaSegura123',
    telefone: '11988888888',
  );

  print('Resultado Cadastro: $resRegister');

  // Tenta realizar o login via App
  var resLogin = await authService.login(
    email: 'mateus.app@limpex.com',
    senha: 'senhaSegura123',
  );

  print('Resultado Login: $resLogin');
}

class LimpeXApp extends StatelessWidget {
  const LimpeXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LimpeX',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('LimpeX'),
        ),
        body: const Center(
          child: Text(
            'LimpeX funcionando!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}