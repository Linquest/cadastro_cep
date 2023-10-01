import 'package:flutter/material.dart';
import 'package:cadastro_cep/screens/cep_list_screen.dart';
import 'package:cadastro_cep/screens/cep_update_screen.dart';

class AppRoutes {
  static const String cepList = '/ceplist';
  static const String cepUpdate = '/cepupdate';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case cepList:
        return MaterialPageRoute(builder: (_) => const CepListScreen());
      case cepUpdate:
        final Map<String, dynamic>? cepData = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => CepUpdateScreen(cepData: cepData!),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
