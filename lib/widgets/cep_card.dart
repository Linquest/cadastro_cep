import 'package:cadastro_cep/models/cep.dart';
import 'package:flutter/material.dart';

class CepCard extends StatelessWidget {
  final CepModel cep;
  final VoidCallback? onUpdate;
  final VoidCallback? onDelete;

  const CepCard({
    super.key,
    required this.cep,
     this.onUpdate,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CEP: ${cep.cep}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text('Logradouro: ${cep.logradouro}'),
            Text('Bairro: ${cep.bairro}'),
            Text('Localidade: ${cep.localidade}'),
            Text('UF: ${cep.uf}'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: onUpdate,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return CepDeleteConfirmationDialog(
                    //       onDeleteConfirmed: onDelete,
                    //     );
                    //   },
                    // );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
