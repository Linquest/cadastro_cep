import 'package:cadastro_cep/models/cep.dart';
import 'package:cadastro_cep/widgets/cep_card.dart';
import 'package:cadastro_cep/widgets/cep_delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_cep/services/back4app_service.dart';
import 'package:cadastro_cep/screens/cep_update_screen.dart';

class CepListScreen extends StatefulWidget {
  const CepListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CepListScreenState createState() => _CepListScreenState();
}

class _CepListScreenState extends State<CepListScreen> {
  late Future<List<CepModel>> ceps;

  @override
  void initState() {
    super.initState();
    ceps = Back4AppService.fetchCEPs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de CEPs'),
      ),
      body: FutureBuilder<List<CepModel>>(
        future: ceps,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os CEPs.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum CEP encontrado.'));
          } else {
            final ceps = snapshot.data!;
            return ListView.builder(
              itemCount: ceps.length,
              itemBuilder: (context, index) {
                final cep = ceps[index];
                return CepCard(
                  cep: cep,
                  onUpdate: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CepUpdateScreen(cepData: cep.toMap()),
                      ),
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CepDeleteConfirmationDialog(
                          onDeleteConfirmed: () async {
                            await Back4AppService.deleteCEP(cep.objectId);
                            setState(() {
                              ceps.remove(cep);
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
