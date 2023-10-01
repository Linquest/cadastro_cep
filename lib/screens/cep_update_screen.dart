import 'package:flutter/material.dart';
import 'package:cadastro_cep/services/back4app_service.dart';

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
    // Inicialize os controladores com os dados existentes do CEP
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
                // Obtém os dados atualizados dos controladores
                final updatedCepData = {
                  'cep': cepController.text,
                  'logradouro': logradouroController.text,
                  'bairro': bairroController.text,
                  'localidade': localidadeController.text,
                  'uf': ufController.text,
                };

                // Chama a função para atualizar o CEP
                Back4AppService.updateCEP(widget.cepData['objectId'], updatedCepData)
                    .then((_) {
                  // Atualização bem-sucedida, você pode navegar de volta para a tela anterior ou fornecer feedback ao usuário.
                  Navigator.of(context).pop();
                }).catchError((error) {
                  // Lidere com erros de atualização, por exemplo, exibindo uma mensagem de erro.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Erro ao atualizar o CEP: $error'),
                    ),
                  );
                });
              },
              child: const Text('Atualizar CEP'),
            ),
          ],
        ),
      ),
    );
  }
}