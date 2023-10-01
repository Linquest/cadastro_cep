import 'package:flutter/material.dart';
import 'package:cadastro_cep/screens/cep_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consulta de CEP do Fernando',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CepSearchScreen(), // Defina a tela inicial aqui
    );
  }
}
