// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/fonts.constants.dart';
import 'package:flutter_technical_test_motel_list/constants/icons.constants.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_technical_test_motel_list/core/models/promotion.model.dart';
import 'package:flutter_technical_test_motel_list/widgets/dashed.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/filters.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/hotel.widget.dart';
import 'package:flutter_technical_test_motel_list/widgets/promotion.widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _promoController = PageController(viewportFraction: 1.0);

  final Map<String, dynamic> hotels = {
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
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
						],
						"itens": [
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "TV LED 32''"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "garagem coletiva"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "acesso à suíte via escadas"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 88.0,
								"desconto": null,
								"valorTotal": 88.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 101.0,
								"desconto": null,
								"valorTotal": 101.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 129.58,
								"desconto": {
									"desconto": 48.0
								},
								"valorTotal": 81.58,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 1,
						"nome": "Suíte Marselha Sexy",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/64838168-0e40-4087-bc99-445ee4a0754b-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/eaaad10a-654a-432f-ac19-ec0db9505c70-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/babf262a-15d9-40d3-8828-d68f77a23749-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/ed3ff4dc-3049-42ab-8913-c45305f4a9ed-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/2ddcafcf-7039-43dc-b35c-4b1fa6e55ecc-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/d91b69f4-88e8-4dc0-90c1-8aedeb28410f-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/17418-Marselha-Sexy/fotos/ab606435-1454-4ae3-adda-a7b708da950a-suites.jpg"
						],
						"itens": [
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "smart TV 42\""
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "globo de luz"
							},
							{
								"nome": "garagem coletiva"
							},
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "ambiente erótico"
							},
							{
								"nome": "X erótico"
							},
							{
								"nome": "pole dance"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 129.0,
								"desconto": null,
								"valorTotal": 129.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 162.0,
								"desconto": null,
								"valorTotal": 162.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 184.0,
								"desconto": {
									"desconto": 68.4
								},
								"valorTotal": 115.6,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Decoração Erótica",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png"
							},
							{
								"nome": "Decoração Temática",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-tematica-22-08-2018-11-40.png"
							},
							{
								"nome": "Pole Dance",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/pole-dance-15-05-2020-10-49.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 2,
						"nome": "Suíte Nantes s/ garagem privativa",
						"fotos": [
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_2.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_1.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_3.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_4.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9828_5.jpg"
						],
						"itens": [
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "TV LED 32''"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "garagem coletiva"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "acesso à suíte via escadas"
							},
							{
								"nome": "banheira de hidromassagem"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 116.0,
								"desconto": null,
								"valorTotal": 116.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 145.0,
								"desconto": null,
								"valorTotal": 145.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 186.0,
								"desconto": {
									"desconto": 69.2
								},
								"valorTotal": 116.8,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 6,
						"nome": "Suíte Versalhes",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9829-Versalhes/fotos/foto1-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9829-Versalhes/fotos/foto2-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9829-Versalhes/fotos/foto3-suites.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9829_1.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9829_2.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9829_3.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9829_4.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9829_5.jpg"
						],
						"itens": [
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "TV LED 32''"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 140.0,
								"desconto": null,
								"valorTotal": 140.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 169.0,
								"desconto": null,
								"valorTotal": 169.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 207.0,
								"desconto": {
									"desconto": 77.6
								},
								"valorTotal": 129.4,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": false
					},
					{
						"qtd": 7,
						"nome": "Suíte Cannes",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/5fc92788-5a24-4d80-8c0c-1af2293923c0-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/6b779467-2c42-4197-9b9b-6579d7a31eec-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/aba770c2-2dcd-486e-b72a-d1d1f72ff910-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/3d84bfff-9e41-4117-806e-9e8b45dd1750-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/57b9e599-28b3-4716-b267-bfcba26b4f85-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/8625b926-020d-4718-89d7-2e5e00c01b5d-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/foto5-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/foto4-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/foto6-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/foto3-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9830-Cannes/fotos/foto1-suites.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9830_1.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9830_5.jpg"
						],
						"itens": [
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "smart TV"
							},
							{
								"nome": "automação via tablet"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "banheira de hidromassagem"
							},
							{
								"nome": "poltrona erótica"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 158.0,
								"desconto": null,
								"valorTotal": 158.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 188.0,
								"desconto": null,
								"valorTotal": 188.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 232.0,
								"desconto": {
									"desconto": 87.6
								},
								"valorTotal": 144.4,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Cadeira Erótica",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/cadeira-erotica-22-08-2018-11-40.png"
							},
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": false
					},
					{
						"qtd": 1,
						"nome": "Suíte Nice",
						"fotos": [
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9831_1.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/foto1-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/foto2-suites.jpg",
							"https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9831_2.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/917d3711-75c8-4f7b-a8dd-1e145406e502-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/3ae58ee7-1272-4690-8692-b8364610df10-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/2f5a8f48-2a36-4e05-9020-0d2d61491933-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9831-Nice/fotos/7c212cb1-62be-4f12-9bcd-fc6e99d4a664-suites.jpg"
						],
						"itens": [
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "teto solar"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "automação via tablet"
							},
							{
								"nome": "TV Smart com NetFlix"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "hidro spa"
							},
							{
								"nome": "piscina aquecida"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 307.0,
								"desconto": null,
								"valorTotal": 307.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 329.0,
								"desconto": null,
								"valorTotal": 329.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 377.0,
								"desconto": null,
								"valorTotal": 377.0,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Piscina",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/piscina-22-08-2018-11-37.png"
							},
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 2,
						"nome": "Suíte Le Sex",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/7a38b450-d6c1-4345-ab8a-b926227ea503-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/afe11e03-ce42-4a68-93a4-88aa5908bc25-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/de335a19-e5e4-41c1-a55b-5b97360c64f1-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/66af0b38-033b-4149-a4c1-5c0cb1346396-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/52fcca34-1c5a-4f89-8d46-a2e767fe2098-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/d2b88f1a-d584-4e72-b906-1fe1c100af7e-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18087-Le-Sex/fotos/2ff0664c-cfcc-4ab1-bd85-3c68129fc30f-suites.jpg"
						],
						"itens": [
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "iluminação de led"
							},
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "automação via tablet"
							},
							{
								"nome": "Alexa"
							},
							{
								"nome": "algemas na cama"
							},
							{
								"nome": "acessórios eróticos"
							},
							{
								"nome": "TV Smart com NetFlix"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "vitrine erótica"
							},
							{
								"nome": "jogo de dados eróticos"
							},
							{
								"nome": "hidro spa"
							},
							{
								"nome": "ambiente erótico"
							},
							{
								"nome": "X erótico"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "Wi-Fi"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 342.0,
								"desconto": null,
								"valorTotal": 342.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 370.0,
								"desconto": null,
								"valorTotal": 370.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 425.0,
								"desconto": null,
								"valorTotal": 425.0,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Decoração Erótica",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-erotica-30-10-2023-11-43.png"
							},
							{
								"nome": "Decoração Temática",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/decoracao-tematica-22-08-2018-11-40.png"
							},
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 1,
						"nome": "Suíte Paris",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/9258c152-8734-4aaf-9c83-1d2cac791c26-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/9da2cbc5-d61a-4e6d-9baf-72c0f7cb427c-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/cca91ce0-1659-4730-8229-06e53e186a32-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/1d00b104-311c-45ff-9b08-cc43680913c3-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/8008b5dd-3895-45cb-9bfc-5b1bf36ddfbd-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/48e1441f-00d7-4eea-9dac-f109a6906ca5-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/3457e01d-577f-4c6c-966b-e6fccb4838a8-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/e228d40d-ce02-4d8b-a701-90a2d14707b3-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/b1244ee8-737b-4681-9a8e-b5ebedb66df2-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/6b2da604-7392-4b22-b176-838edf98fd3a-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/59a0937f-8401-43c3-b17f-a2603942f72d-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/399d922c-f4f6-47be-9c36-aa51aba40f96-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/73eedd43-141f-4c78-94be-eae8f5a23cad-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/18086-Paris/fotos/7bbd0600-febf-462a-9753-fdce17f72254-suites.jpg"
						],
						"itens": [
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "automação via tablet"
							},
							{
								"nome": "assistente virtual Alexa"
							},
							{
								"nome": "TV Smart com NetFlix"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "hidro spa"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 350.0,
								"desconto": null,
								"valorTotal": 350.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 380.0,
								"desconto": null,
								"valorTotal": 380.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 441.0,
								"desconto": null,
								"valorTotal": 441.0,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
							}
						],
						"exibirQtdDisponiveis": true
					},
					{
						"qtd": 1,
						"nome": "Suíte Le Nid",
						"fotos": [
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto1-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto2-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto3-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto4-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto5-suites.jpg",
							"https://cdn.guiademoteis.com.br/Images/moteis/3148-Motel-Le-Nid/suites/9832-Le-Nid/fotos/foto6-suites.jpg"
						],
						"itens": [
							{
								"nome": "som AM/FM"
							},
							{
								"nome": "ducha dupla"
							},
							{
								"nome": "TV a cabo"
							},
							{
								"nome": "iluminação por leds"
							},
							{
								"nome": "3 canais eróticos"
							},
							{
								"nome": "smart TV 70\""
							},
							{
								"nome": "automação via tablet"
							},
							{
								"nome": "teto solar"
							},
							{
								"nome": "TV Smart com NetFlix"
							},
							{
								"nome": "bluetooth"
							},
							{
								"nome": "espelho no teto"
							},
							{
								"nome": "hidro spa"
							},
							{
								"nome": "piscina aquecida com cascata"
							},
							{
								"nome": "garagem privativa"
							},
							{
								"nome": "frigobar"
							},
							{
								"nome": "ar-condicionado split"
							},
							{
								"nome": "WI-FI"
							},
							{
								"nome": "secador de cabelo"
							}
						],
						"periodos": [
							{
								"tempo": "3",
								"valor": 367.0,
								"desconto": null,
								"valorTotal": 367.0,
								"temCortesia": false,
								"tempoFormatado": "3 horas"
							},
							{
								"tempo": "6",
								"valor": 395.0,
								"desconto": null,
								"valorTotal": 395.0,
								"temCortesia": false,
								"tempoFormatado": "6 horas"
							},
							{
								"tempo": "12",
								"valor": 452.0,
								"desconto": null,
								"valorTotal": 452.0,
								"temCortesia": false,
								"tempoFormatado": "12 horas"
							}
						],
						"categoriaItens": [
							{
								"nome": "Hidro",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/hidro-22-08-2018-11-37.png"
							},
							{
								"nome": "Piscina",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/piscina-22-08-2018-11-37.png"
							},
							{
								"nome": "Garagem Privativa",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/garagem-privativa-04-09-2018-12-14.png"
							},
							{
								"nome": "Frigobar",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png"
							},
							{
								"nome": "Ar-Condicionado",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/arcondicionado-04-09-2018-12-13.png"
							},
							{
								"nome": "Internet Wi-Fi",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"
							},
							{
								"nome": "Secador de Cabelo",
								"icone": "https://cdn.guiademoteis.com.br/Images/itens-suites/secador-de-cabelo-04-09-2018-12-14.png"
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
		"maxPaginas": 1.0,
		"totalMoteis": 1,
		"totalSuites": 0,
		"qtdPorPagina": 10
	};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: _buildIconButton(
          icon: AppIcons.menuIcon, 
          iconSize: 20,
          action: () {}
        ),
        title: _buildTitle(),
        actions: <Widget>[
          _buildIconButton(
            icon: AppIcons.searchIcon, 
            iconSize: 19,
            action: () {}
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildRegion(value: 'Zona Norte'),
          _buildScroll(),
        ],
      ),
      floatingActionButton: _buildFloatingAction(
        title: 'mapa',
        icon: Icons.map_outlined,
        iconColor: AppColors.primary,
        textColor: AppColors.primary,
        bgColor: AppColors.white,
        action: (){},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Expanded _buildScroll() {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Expanded(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(bottom: bottomPadding),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildPromotion(),
            ),
            SliverStickyHeader(
              header: FiltersWidgets(),
              sliver: _buildHotels(hotels: hotels),
            ),
          ],
        ),
      ),
    );
  }

  SliverList _buildHotels({
    required Map<String, dynamic> hotels
  }) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var hotel = hotels['moteis'][index];
          return HotelWidget(hotel: hotel);
        },
        childCount: hotels['moteis'].length,
      ),
    );
  }

  Align _buildTitle() {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300,
            minWidth: 240,
          ),
          child: Container(
            height: 40,
            color: AppColors.primary900,
            child: Row(
              children: [
                _buildActionButton(
                  icon: AppIcons.flashIcon, 
                  sizeIcon: 20,
                  title: 'ir agora',
                  active: true
                ),
                _buildActionButton(
                  icon: AppIcons.calendarIcon, 
                  sizeIcon: 18,
                  title: 'ir outro dia',
                  active: false
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildIconButton({
    required String icon,
    required double iconSize,
    required VoidCallback action
  }) {
    return IconButton(
      icon: SizedBox(
        width: iconSize,
        height: iconSize,
        child: SvgPicture.asset(
          icon,
        ),
      ),
      onPressed: action,
    );
  }

  Expanded _buildActionButton({
    required String icon, 
    required double sizeIcon,
    required String title,
    required bool active
  }) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(44),
        child: Container(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 5),
          color: active ? AppColors.white : AppColors.primary900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: sizeIcon,
                height: sizeIcon,
                child: SvgPicture.asset(
                  icon,
                ),
              ),
              SizedBox(width: active ? 8 : 10),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: AppFontWeight.semiBold,
                    color: active ? AppColors.text : AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }

  Align _buildRegion({
    required String value,
  }) {
    return Align(
      alignment: Alignment.center,
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: Container(
          padding: EdgeInsets.only(bottom: 5),
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toLowerCase(),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: AppFontWeight.semiBold,
                  color: AppColors.white,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(width: 5),
              Container(
                width: 12,
                height: 12,
                margin: EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  AppIcons.arrowDownWhiteIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildPromotion() {
    return Container(
      color: AppColors.secoundary800,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Column(
        children: [
          Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 10),
            child: PageView.builder(
              controller: _promoController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PromotionWidget(
                  promotion: Promotion(
                    title: 'Suite Mock', 
                    location: 'cidade - estado', 
                    discount: 0, price: 0.00
                  )
                );
              }
            ),
          ),
          _buildPageIndicator(
            pageController: _promoController,
            count: 3
          )
        ],
      ),
    );
  }

  SmoothPageIndicator _buildPageIndicator({
    required PageController pageController,
    required int count,
  }) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: CustomizableEffect(
        dotDecoration: DotDecoration(
          color: AppColors.secoundary900,
          height: 6,
          width: 6,
          borderRadius: BorderRadius.circular(6)
        ), 
        activeDotDecoration: DotDecoration(
          color: AppColors.secoundary50,
          height: 12,
          width: 12,
          borderRadius: BorderRadius.circular(12)
        ), 
      )
    );
  }

  Container _buildFloatingAction({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Color textColor,
    required Color bgColor,
    required VoidCallback action,
  }) {
    return Container(
      width: 100,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(30, 0, 0, 0),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: action,
          borderRadius: BorderRadius.circular(40),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                  size: 18,
                ),
                SizedBox(width: 3),
                Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: AppFontWeight.semiBold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}