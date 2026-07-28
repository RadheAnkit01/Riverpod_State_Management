class Product {
  final int id;
  final String productName;
  final double price;
  final bool favourite;

  Product({
    required this.id,
    required this.productName,
    required this.price,
    required this.favourite,
  });

  Product copyWith({
    int? id,
    String? productName,
    double? price,
    bool? favourite,
  }) {
    return Product(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      favourite: favourite ?? this.favourite,
    );
  }
}
