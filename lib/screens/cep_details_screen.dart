import 'package:flutter/material.dart';

class CepDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> cepData;

  const CepDetailsScreen({super.key, required this.cepData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CEP: ${cepData['cep']}'),
            Text('Logradouro: ${cepData['logradouro']}'),
            Text('Bairro: ${cepData['bairro']}'),
            Text('Localidade: ${cepData['localidade']}'),
            Text('UF: ${cepData['uf']}'),
          ],
        ),
      ),
    );
  }
}
