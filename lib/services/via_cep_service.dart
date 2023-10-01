import 'dart:convert';
import 'package:http/http.dart' as http;

class ViaCEPService {
  static Future<Map<String, dynamic>> fetchCEP(String cep) async {
    final Uri uri = Uri.parse('https://viacep.com.br/ws/$cep/json/');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Não foi possível buscar o endereço.');
    }
  }
}
