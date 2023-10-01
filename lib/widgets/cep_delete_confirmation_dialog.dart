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
            // Feche o diálogo sem excluir o CEP
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Chame a função de exclusão quando a exclusão for confirmada
            onDeleteConfirmed();
            Navigator.of(context).pop();
          },
          child: const Text('Excluir'),
        ),
      ],
    );
  }
}
