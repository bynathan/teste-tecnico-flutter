// ignore: depend_on_referenced_packages
import 'package:http/http.dart';
import 'package:flutter_technical_test_motel_list/constants/url_constants.dart';
import 'dart:convert';
import 'package:flutter_technical_test_motel_list/core/models/motel_model.dart';

class MotelService {
  final Client client;

  MotelService({required this.client});

  Future<List<Motel>> fetchMotels() async {
    try {
      final response = await client.get(Uri.parse('${AppUrl.baseUrl}/e728bb91e0cd56cc0711'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body);

        List<dynamic> data = body["data"]["moteis"];
        
        return data.map((motel) => Motel.fromMap(motel)).toList();
      } else {
        throw Exception('Failed to load motels');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
