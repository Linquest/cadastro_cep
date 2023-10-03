import 'package:cadastro_cep/models/cep.dart';
import 'package:flutter/material.dart';

class CrudProvider with ChangeNotifier {
  final List<CepModel> _address = [];
  List<CepModel> get address => [..._address];

  void fetchAdress() {
    notifyListeners();
  }

  void addAddress() {
    notifyListeners();
  }

  void updateAdress() {
    notifyListeners();
  }

  void removeAdress() {
    notifyListeners();
  }
}
