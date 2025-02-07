class Suite {
  final int quantity;                                  // Quantidade de suítes
  final String name;                                   // Nome da suíte
  final List<String> photos;                           // Lista de URLs das fotos
  final List<Map<String, dynamic>> items;              // Itens da suíte
  final List<Map<String, dynamic>> periods;            // Períodos de disponibilidade
  final List<Map<String, dynamic>> categoryItems;      // Categorias dos itens
  final bool showAvailableQuantity;                    // Exibir quantidade disponível

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
      quantity: map['quantity'] ?? 0,
      name: map['name'] ?? '',
      photos: List<String>.from(map['photos'] ?? []),
      items: (map['items'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [],
      periods: (map['periods'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [],
      categoryItems: (map['categoryItems'] as List?)?.map((e) => Map<String, dynamic>.from(e)).toList() ?? [],
      showAvailableQuantity: map['showAvailableQuantity'] ?? false,
    );
  }
}
