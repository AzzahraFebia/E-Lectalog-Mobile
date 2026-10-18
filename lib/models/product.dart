class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      // Menggunakan double.parse lalu di-toUInt/toInt agar aman membaca format desimal (.00)
      price: json['price'] is num 
          ? (json['price'] as num).toInt() 
          : double.parse(json['price'].toString()).toInt(),
      stock: json['stock'] is int 
          ? json['stock'] 
          : int.parse(json['stock'].toString()),
    );
  }
}