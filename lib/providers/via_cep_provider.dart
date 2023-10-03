import 'package:cadastro_cep/models/cep.dart';
import 'package:cadastro_cep/services/via_cep_service.dart';
import 'package:flutter/material.dart';

class ViaCepProvider with ChangeNotifier {
  final ViaCEPService _cepRepository = ViaCEPService();
  CepModel? address;
  bool loading = true;

  fetchViaCep({required String cep}) async {
    loading = true;
    address = await _cepRepository.fetchCEP(cep);
    loading = false;

    notifyListeners(); // notifica a view
  }
}
