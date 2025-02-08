import 'dart:convert';
import 'package:http/http.dart' as http;

class MotelService {
  // Método para buscar os motéis da API
  Future<List<Motel>> fetchMotels() async {
    final response = await http.get(Uri.parse('https://jsonkeeper.com/b/1IXK'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((motelData) => Motel.fromJson(motelData)).toList();
    } else {
      throw Exception('Falha ao carregar motéis');
    }
  }
}