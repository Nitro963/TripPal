class Filter {
  String type;
  List<Map<String, dynamic>> items = List<Map<String, dynamic>>.empty(growable: true);

  Filter(
    this.type,
    this.items
  );
}
