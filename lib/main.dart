import 'package:flutter/material.dart';

void main() {
  runApp(const LimpeXApp());
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