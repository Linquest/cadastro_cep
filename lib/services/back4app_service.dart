import 'dart:convert';
import 'package:http/http.dart' as http;

class Back4AppService {
  static const String appId = 'IzSrAB8UrfyDPNLqFC4BvWeXlPwifmYTgua6Ux7d';
  static const String apiKey = 'ub3fZUbvZcpMpWP7uBkQUtzZaK3LHYZvH2CN6fNb';
  static const String baseUrl = 'https://parseapi.back4app.com/classes/CEP';

  static Future<List<Map<String, dynamic>>> fetchCEPs() async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Não foi possível carregar os CEPs do Back4App.');
    }
  }

  static Future<void> createCEP(Map<String, dynamic> cepData) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json',
      },
      body: json.encode(cepData),
    );

    if (response.statusCode != 201) {
      throw Exception('Não foi possível criar o CEP no Back4App.');
    }
  }

  static Future<void> updateCEP(String objectId, Map<String, dynamic> updatedCepData) async {
    final url = '$baseUrl/$objectId';

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
        'Content-Type': 'application/json',
      },
      body: json.encode(updatedCepData),
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível atualizar o CEP no Back4App.');
    }
  }

  static Future<void> deleteCEP(String objectId) async {
    final url = '$baseUrl/$objectId';

    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'X-Parse-Application-Id': appId,
        'X-Parse-REST-API-Key': apiKey,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Não foi possível excluir o CEP do Back4App.');
    }
  }
}
