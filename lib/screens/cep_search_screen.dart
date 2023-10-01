import 'package:flutter/material.dart';
import 'package:cadastro_cep/services/via_cep_service.dart';
import 'package:cadastro_cep/services/back4app_service.dart';
import 'package:cadastro_cep/widgets/loading_indicator.dart';

class CepSearchScreen extends StatefulWidget {
  const CepSearchScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CepSearchScreenState createState() => _CepSearchScreenState();
}

class _CepSearchScreenState extends State<CepSearchScreen> {
  final _cepController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Map<String, dynamic>? _cepData;

  Future<void> _searchCep() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final cep = _cepController.text;
      try {
        final data = await ViaCEPService.fetchCEP(cep);
        setState(() {
          _cepData = data;
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _cepData = null;
          _isLoading = false;
        });
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro ao buscar CEP'),
              content: const Text('O CEP informado não foi encontrado.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'),
                ),
                TextButton(
                  onPressed: () async {
                    if (_cepData != null) {
                      await Back4AppService.createCEP(_cepData!);
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Cadastrar CEP'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Consultar CEP',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um CEP.';
                  } else if (value.length != 8) {
                    return 'O CEP deve conter 8 dígitos.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLoading ? null : _searchCep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: _isLoading
                    ? const LoadingIndicator()
                    : const Text('Consultar CEP'),
              ),
              const SizedBox(height: 16.0),
              if (_isLoading)
                const LoadingIndicator(),
              else if (_cepData != null)
                CepCard(
                  cep: _cepData!,
                  onUpdate: () {},
                  onDelete: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}