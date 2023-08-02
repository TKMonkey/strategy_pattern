class Item {
  final String name;
  final double price;
  final String description;

  Item(this.name, this.price);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price;

  @override
  int get hashCode => name.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'Item{name: $name, price: $price}';
  }
}
