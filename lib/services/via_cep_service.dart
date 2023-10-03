import 'dart:convert';
import 'package:cadastro_cep/models/cep.dart';
import 'package:http/http.dart' as http;

class ViaCEPService {

  Future<CepModel> fetchCEP(String cep) async {
    try {
      final response =
          await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json'));
      return CepModel.fromMap(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
