import 'package:flutter/material.dart';

class CepDeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onDeleteConfirmed;

  const CepDeleteConfirmationDialog({super.key, required this.onDeleteConfirmed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmação de Exclusão'),
      content: const Text('Tem certeza de que deseja excluir este CEP?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onDeleteConfirmed();
            Navigator.of(context).pop();
          },
          child: const Text('Excluir'),
        ),
      ],
    );
  }
}
