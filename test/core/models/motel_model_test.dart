import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_technical_test_motel_list/core/models/motel_model.dart';

void main() {
  group('Motel Model Tests', () {
    test('should create a Motel from a map', () {
      final map = {
        'logo': 'link',
        'media': 0.0,
        'bairro': '',
        'suites': [],
        'fantasia': '',
        'distancia': 0.0,
        'qtdFavoritos': 0,
        'qtdAvaliacoes': 0,
      };

      final motel = Motel.fromMap(map);

      // Nomes genéricos no teste
      expect(motel.logo, 'link');
      expect(motel.rating, 0.0);
      expect(motel.neighborhood, '');
      expect(motel.suites.isEmpty, true);
      expect(motel.name, '');
      expect(motel.distance, 0.0);
      expect(motel.favoritesCount, 0);
      expect(motel.reviewsCount, 0);
    });

    test('should convert Motel to map correctly', () {
      final motel = Motel(
        logo: 'link',
        rating: 0.0,
        neighborhood: '',
        suites: [],
        name: '',
        distance: 0.0,
        favoritesCount: 0,
        reviewsCount: 0,
      );

      final map = motel.toMap();

      // Nomes genéricos no teste
      expect(map['logo'], 'link');
      expect(map['rating'], 0.0);
      expect(map['neighborhood'], '');
      expect(map['suites'].length, 0);
      expect(map['name'], '');
      expect(map['distance'], 0.0);
      expect(map['favoritesCount'], 0);
      expect(map['reviewsCount'], 0);
    });

    test('should handle missing fields in map during fromMap', () {
      final map = {
        'logo': 'link',
        'media': null,
        'bairro': null,
        'suites': null,
        'fantasia': null,
        'distancia': null,
        'qtdFavoritos': null,
        'qtdAvaliacoes': null
      };

      final motel = Motel.fromMap(map);

      // Nomes genéricos no teste
      expect(motel.logo, 'link');
      expect(motel.rating, 0.0);
      expect(motel.neighborhood, '');
      expect(motel.suites.isEmpty, true);
      expect(motel.name, '');
      expect(motel.distance, 0.0);
      expect(motel.favoritesCount, 0);
      expect(motel.reviewsCount, 0);
    });
  });
}
