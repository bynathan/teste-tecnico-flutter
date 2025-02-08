import 'package:flutter_technical_test_motel_list/core/models/suites_model.dart';

class Motel {
  final String logo;
  final double rating;
  final String neighborhood;
  final List<Suite> suites;
  final String name;
  final double distance;
  final int favoritesCount;
  final int reviewsCount;

  Motel({
    required this.logo,
    required this.rating,
    required this.neighborhood,
    required this.suites,
    required this.name,
    required this.distance,
    required this.favoritesCount,
    required this.reviewsCount,
  });

  factory Motel.fromMap(Map<String, dynamic> map) {
    return Motel(
      logo: map['logo'] ?? '',
      rating: map['media'] ?? 0.0,
      neighborhood: map['bairro'] ?? '',
      suites: map['suites'] is List ? (map['suites'] as List).map((s) => Suite.fromMap(s)).toList() : [],
      name: map['fantasia'] ?? '',
      distance: map['distancia'] ?? 0.0,
      favoritesCount: map['qtdFavoritos'] ?? 0,
      reviewsCount: map['qtdAvaliacoes'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'logo': logo,
      'rating': rating,
      'neighborhood': neighborhood,
      'suites': suites.map((s) => s.toMap()).toList(),
      'name': name,
      'distance': distance,
      'favoritesCount': favoritesCount,
      'reviewsCount': reviewsCount,
    };
  }
}
