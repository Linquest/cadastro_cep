import 'package:flutter/material.dart';

class CepUpdateScreen extends StatefulWidget {
  final Map<String, dynamic> cepData;

  const CepUpdateScreen({super.key, required this.cepData});

  @override
  // ignore: library_private_types_in_public_api
  _CepUpdateScreenState createState() => _CepUpdateScreenState();
}

class _CepUpdateScreenState extends State<CepUpdateScreen> {
  TextEditingController cepController = TextEditingController();
  TextEditingController logradouroController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController localidadeController = TextEditingController();
  TextEditingController ufController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cepController.text = widget.cepData['cep'];
    logradouroController.text = widget.cepData['logradouro'];
    bairroController.text = widget.cepData['bairro'];
    localidadeController.text = widget.cepData['localidade'];
    ufController.text = widget.cepData['uf'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: cepController,
              decoration: const InputDecoration(labelText: 'CEP'),
            ),
            TextField(
              controller: logradouroController,
              decoration: const InputDecoration(labelText: 'Logradouro'),
            ),
            TextField(
              controller: bairroController,
              decoration: const InputDecoration(labelText: 'Bairro'),
            ),
            TextField(
              controller: localidadeController,
              decoration: const InputDecoration(labelText: 'Localidade'),
            ),
            TextField(
              controller: ufController,
              decoration: const InputDecoration(labelText: 'UF'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {

                // Back4AppService.updateCEP(widget.cepData['objectId'], updatedCepData)
                //     .then((_) {
                //   Navigator.of(context).pop();
                // }).catchError((error) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Erro ao atualizar o CEP: $error'),
                //     ),
                //   );
                // });
              },
              child: const Text('Atualizar CEP'),
            ),
          ],
        ),
      ),
    );
  }
}