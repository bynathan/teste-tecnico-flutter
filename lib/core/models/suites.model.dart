class Suite {
  final int quantity;
  final String name;
  final List<String> photos;
  final List<Map<String, dynamic>> items;
  final List<Map<String, dynamic>> periods;
  final List<Map<String, dynamic>> categoryItems;
  final bool showAvailableQuantity;

  Suite({
    required this.quantity,
    required this.name,
    required this.photos,
    required this.items,
    required this.periods,
    required this.categoryItems,
    required this.showAvailableQuantity,
  });

  factory Suite.fromMap(Map<String, dynamic> map) {
    return Suite(
      quantity: map['qtd'] ?? 0,
      name: map['nome'] ?? '',
      photos: List<String>.from(map['fotos'] ?? []),
      items: (map['itens'] as List?)?.map((e) => Map<String, dynamic>.from(e as Map)).toList() ?? [],
      periods: (map['periodos'] as List?)?.map((e) => Map<String, dynamic>.from(e as Map)).toList() ?? [],
      categoryItems: (map['categoriaItens'] as List?)?.map((e) => Map<String, dynamic>.from(e as Map)).toList() ?? [],
      showAvailableQuantity: map['exibirQtdDisponiveis'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'name': name,
      'photos': photos,
      'items': items,
      'periods': periods,
      'categoryItems': categoryItems,
      'showAvailableQuantity': showAvailableQuantity,
    };
  }
}