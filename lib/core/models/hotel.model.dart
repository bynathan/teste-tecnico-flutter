import 'package:flutter_technical_test_motel_list/core/models/suites.model.dart';

class Hotel {
  final String logo;
  final double rating;
  final String neighborhood;
  final List<Suite> suites;
  final String name;
  final double distance;
  final int favoritesCount;
  final int reviewsCount;

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
      logo: map['logo'] ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      neighborhood: map['neighborhood'] ?? '',
      suites: (map['suites'] as List?)?.map((s) => Suite.fromMap(s)).toList() ?? [],
      name: map['name'] ?? '',
      distance: (map['distance'] as num?)?.toDouble() ?? 0.0,
      favoritesCount: map['favoritesCount'] ?? 0,
      reviewsCount: map['reviewsCount'] ?? 0,
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
