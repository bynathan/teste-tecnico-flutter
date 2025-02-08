// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_technical_test_motel_list/core/models/motel.model.dart';

class MotelService {
  Future<List<Motel>> fetchMotels() async {
    try {
      final response = await http.get(Uri.parse('https://api.npoint.io/e728bb91e0cd56cc0711'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);
        List<dynamic> data = body["data"]["moteis"];
        return data.map((motel) => Motel.fromMap(motel)).toList();
      } else {
        throw Exception('Falha ao carregar motéis');
      }
    } catch (e) {
      throw Exception('Erro ao buscar dados: $e');
    }
  }
}
