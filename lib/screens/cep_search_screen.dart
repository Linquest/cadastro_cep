import 'package:cadastro_cep/models/cep.dart';
import 'package:cadastro_cep/providers/via_cep_provider.dart';
import 'package:cadastro_cep/widgets/cep_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CepSearchScreen extends StatefulWidget {
  const CepSearchScreen({super.key});

  @override
  State<CepSearchScreen> createState() => _CepSearchScreenState();
}

class _CepSearchScreenState extends State<CepSearchScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;
  CepModel? address;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _cepController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final viaCepProvider = Provider.of<ViaCepProvider>(context);

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
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    viaCepProvider.fetchViaCep(cep: _cepController.text);
                    address = viaCepProvider.address!;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: const Text('Consultar CEP'),
              ),
              const SizedBox(height: 16.0),
              if (isEmptyAddress(address!))
                Center(
                  child: Column(
                    children: [
                      const Text('Cep nao encontrado!'),
                      ElevatedButton(
                          onPressed: () {//// PASSAR P PAGINA DE CADASTRO FAZER LOGICA DE CADASTRO
                          }, child: const Text('Cadastrar')),
                    ],
                  ),
                )
              else
                CepCard(cep: address!)
            ],
          ),
        ),
      ),
    );
  }
}

bool isEmptyAddress(CepModel address) {
  return address.bairro.isEmpty || address.cep.isEmpty;
}
