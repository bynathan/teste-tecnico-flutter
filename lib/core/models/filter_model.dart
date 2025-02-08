class Filter {
  final int id;
  final String name;
  bool isSelected;

  Filter({required this.id, required this.name, this.isSelected = false});
}