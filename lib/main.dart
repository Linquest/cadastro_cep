import 'package:cadastro_cep/providers/crud_provider.dart';
import 'package:cadastro_cep/providers/via_cep_provider.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_cep/screens/cep_search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ViaCepProvider>(
          create: (_) => ViaCepProvider(),
        ),
        ChangeNotifierProvider<CrudProvider>(
          create: (_) => CrudProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Consulta de CEP do Fernando',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CepSearchScreen(),
      ),
    );
  }
}
