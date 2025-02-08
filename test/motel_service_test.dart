import 'package:flutter_technical_test_motel_list/core/services/model.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'motel_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('MotelService', () {
    test('deve retornar uma lista de motéis se a requisição for bem-sucedida', () async {
      final client = MockClient();
      final motelService = MotelService();

      when(client.get(Uri.parse('https://jsonkeeper.com/b/1IXK')))
          .thenAnswer((_) async => http.Response(
                '[{"name": "Motel 1", "price": 100.0, "image": "url_image_1"}]',
                200,
              ));

      final motels = await motelService.fetchMotels();
      expect(motels.length, 1);
      expect(motels[0].name, 'Motel 1');
      expect(motels[0].price, 100.0);
      expect(motels[0].imageUrl, 'url_image_1');
    });

    test('deve lançar uma exceção se a requisição falhar', () async {
      final client = MockClient();
      final motelService = MotelService();

      when(client.get(Uri.parse('https://jsonkeeper.com/b/1IXK')))
          .thenAnswer((_) async => http.Response('Erro', 500));

      expect(() => motelService.fetchMotels(), throwsException);
    });
  });
}