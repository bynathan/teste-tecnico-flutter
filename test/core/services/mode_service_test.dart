import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:flutter_technical_test_motel_list/core/models/motel_model.dart';
import 'package:flutter_technical_test_motel_list/core/services/motel_service.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  setUpAll(() {
    registerFallbackValue(Uri.parse(''));
  });

  final client = ClientMock();
  MotelService motelService = MotelService(client: client);

  test('should fetch motels and return a list of Motel objects', () async {
    when(() => client.get(any())).thenAnswer((_) async => http.Response(jsonReturn, 200));
    
    List<Motel> motels = await motelService.fetchMotels();

    expect(motels.isNotEmpty, equals(true));
    expect(motels, isA<List<Motel>>());
  });

  test('should return an empty list when the "moteis" field is missing', () async {
    when(() => client.get(any())).thenAnswer((_) async => http.Response('{"data": {"moteis":[]}}', 200));
    
    List<Motel> motels = await motelService.fetchMotels();
    
    expect([], motels);
  });

  test('should correctly parse the motel data from the response', () async {
    when(() => client.get(any())).thenAnswer((_) async => http.Response(jsonReturn, 200));
    
    List<Motel> motels = await motelService.fetchMotels();
    
    expect(motels.first.name, equals("Motel Le Nid"));
    expect(motels.first.suites.first.name, equals("Suíte Marselha s/ garagem privativa"));
  });

  test('should throw an exception when the response code is not 200', () async {
    when(() => client.get(any())).thenAnswer((_) async => http.Response('Error', 500));
    
    expect(() async => await motelService.fetchMotels(), throwsA(isA<Exception>()));
  });

  test('should throw an exception when there is a network error', () async {
    when(() => client.get(any())).thenThrow(Exception('Network error'));

    expect(() async => await motelService.fetchMotels(), throwsA(isA<Exception>()));
  });
}

const jsonReturn = '''
{
  "data": {
    "raio": 0,
    "moteis": [
      {
        "logo": "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        "media": 4.6,
        "bairro": "Chácara Flora - São Paulo",
        "suites": [
          {
            "qtd": 1,
            "nome": "Suíte Marselha s/ garagem privativa",
            "fotos": [
              "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"
            ],
            "itens": [
              {
                "nome": "ducha dupla"
              }
            ],
            "periodos": [
              {
                "tempo": "3",
                "valor": 88,
                "desconto": null,
                "valorTotal": 88,
                "temCortesia": false,
                "tempoFormatado": "3 horas"
              }
            ],
            "categoriaItens": [
              {
                "nome": "Frigobar",
                "icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
              }
            ],
            "exibirQtdDisponiveis": true
          }
        ],
        "fantasia": "Motel Le Nid",
        "distancia": 28.27,
        "qtdFavoritos": 0,
        "qtdAvaliacoes": 2159
      }
    ],
    "pagina": 1,
    "maxPaginas": 1,
    "totalMoteis": 1,
    "totalSuites": 0,
    "qtdPorPagina": 10
  },
  "sucesso": true,
  "mensagem": []
}
''';
