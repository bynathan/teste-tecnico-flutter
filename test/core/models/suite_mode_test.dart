import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_technical_test_motel_list/core/models/suites_model.dart';

void main() {
  group('Suite Model Tests', () {
    test('should create a Suite from a map', () {
      final map = {
        'qtd': 1,
        'nome': 'Suite',
        'fotos': ["link"],
        'itens': [{'nome': 'Item'}],
        'periodos': [
          {
            'tempo': '3 horas',
            'valor': 100.0,
            'desconto': null,
            'valorTotal': 100.0,
            'temCortesia': false,
            'tempoFormatado': '3 horas'
          }
        ],
        'categoriaItens': [
          {'nome': 'Categoria', 'icone': 'link'}
        ],
        'exibirQtdDisponiveis': true,
      };

      final suite = Suite.fromMap(map);

      expect(suite.quantity, 1);
      expect(suite.name, 'Suite');
      expect(suite.photos, isNotEmpty);
      expect(suite.photos.length, 1);
      expect(suite.items, isNotEmpty);
      expect(suite.items.length, 1);
      expect(suite.periods, isNotEmpty);
      expect(suite.periods.length, 1);
      expect(suite.categoryItems, isNotEmpty);
      expect(suite.categoryItems.length, 1);
      expect(suite.showAvailableQuantity, true);
    });

    test('should convert Suite to map correctly', () {
      final suite = Suite(
        quantity: 1,
        name: 'Suite',
        photos: ["link"],
        items: [{'nome': 'Item'}],
        periods: [
          {
            'tempo': '3 horas',
            'valor': 100.0,
            'desconto': null,
            'valorTotal': 100.0,
            'temCortesia': false,
            'tempoFormatado': '3 horas'
          }
        ],
        categoryItems: [
          {'nome': 'Categoria', 'icone': 'link'}
        ],
        showAvailableQuantity: true,
      );

      final map = suite.toMap();

      expect(map['quantity'], 1);
      expect(map['name'], 'Suite');
      expect(map['photos'], isNotEmpty);
      expect(map['photos'].length, 1);
      expect(map['items'], isNotEmpty);
      expect(map['items'].length, 1);
      expect(map['periods'], isNotEmpty);
      expect(map['periods'].length, 1);
      expect(map['categoryItems'], isNotEmpty);
      expect(map['categoryItems'].length, 1);
      expect(map['showAvailableQuantity'], true);
    });

    test('should handle missing fields in map during fromMap', () {
      final map = {
        'qtd': null,
        'nome': null,
        'fotos': null,
        'itens': null,
        'periodos': null,
        'categoriaItens': null,
        'exibirQtdDisponiveis': null,
      };

      final suite = Suite.fromMap(map);

      expect(suite.quantity, 0);
      expect(suite.name, '');
      expect(suite.photos, isEmpty);
      expect(suite.items, isEmpty);
      expect(suite.periods, isEmpty);
      expect(suite.categoryItems, isEmpty);
      expect(suite.showAvailableQuantity, false);
    });
  });
}
