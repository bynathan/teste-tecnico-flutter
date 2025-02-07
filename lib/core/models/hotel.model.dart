import 'package:flutter_technical_test_motel_list/core/models/suites.model.dart';

class Hotel {
  final String logo;               // Logo
  final double rating;             // Média
  final String neighborhood;       // Bairro
  final List<Suite> suites;        // Suites
  final String name;               // Fantasia
  final double distance;           // Distância
  final int favoritesCount;        // Quantidade de Favoritos
  final int reviewsCount;          // Quantidade de Avaliações

  Hotel({
    required this.logo,
    required this.rating,
    required this.neighborhood,
    required this.suites,
    required this.name,
    required this.distance,
    required this.favoritesCount,
    required this.reviewsCount,
  });

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      logo: map['logo'],
      rating: map['rating']?.toDouble() ?? 0.0,
      neighborhood: map['neighborhood'],
      suites: List<Suite>.from(map['suites']?.map((s) => Suite.fromMap(s)) ?? []),
      name: map['name'],
      distance: map['distance']?.toDouble() ?? 0.0,
      favoritesCount: map['favoritesCount'] ?? 0,
      reviewsCount: map['reviewsCount'] ?? 0,
    );
  }
}
