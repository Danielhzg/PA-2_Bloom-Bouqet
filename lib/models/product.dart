class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryName;
  final int categoryId;
  final double rating;
  final bool isFeatured;
  final bool isOnSale;
  final int discount;
  final int stock; // Tambahkan properti stock

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryName,
    required this.categoryId,
    required this.rating,
    required this.isFeatured,
    required this.isOnSale,
    required this.discount,
    this.stock = 0, // Default nilai stock adalah 0
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String imageUrl = 'assets/images/contoh.jpg'; // Default fallback

    if (json.containsKey('image') && json['image'] != null) {
      imageUrl = json['image'].toString();
    }

    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      price: double.parse(json['price'].toString()),
      imageUrl: imageUrl,
      categoryName: json['category'] != null
          ? json['category']['name']
          : (json['category_name'] ?? 'Uncategorized'),
      categoryId: json['category_id'] ?? 0,
      rating: json['rating']?.toDouble() ?? 0.0,
      isFeatured: json['is_featured'] == 1 || json['is_featured'] == true,
      isOnSale: json['is_on_sale'] == 1 || json['is_on_sale'] == true,
      discount: json['discount'] ?? 0,
      stock: json['stock'] ?? 0, // Parse stock dari JSON
    );
  }
}
