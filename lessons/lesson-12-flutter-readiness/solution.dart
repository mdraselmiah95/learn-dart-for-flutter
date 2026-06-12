// ============================================================
//  Lesson 12 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

Future<void> main() async {

  // ── TASK 1 ────────────────────────────────────────────────
  const phone = Product(id: 1, title: 'Phone', price: 499.0);
  print(phone);                       // → Product(Phone — $499.0)

  // ── TASK 2 ────────────────────────────────────────────────
  Product laptop = Product.fromJson({
    'id': 2,
    'title': 'Laptop',
    'price': 999.99,
  });
  print(laptop);                      // → Product(Laptop — $999.99)
  print(laptop.toJson());             // → {id: 2, title: Laptop, ...}

  // ── TASK 3 ────────────────────────────────────────────────
  Product discounted = laptop.copyWith(price: laptop.price * 0.8);
  print('Sale: $discounted');         // → Product(Laptop — $799.99...)
  print('Original: $laptop');         // → unchanged ✓

  // ── TASK 4 ────────────────────────────────────────────────
  final service = ProductService();
  List<Product> catalog = await service.fetchProducts();
  for (Product p in catalog) {
    print(p);
  }

  // ── TASK 5 ────────────────────────────────────────────────
  print('Total: \$${service.totalValue(catalog)}');     // → 1724.0
  print('Under \$500: ${service.under(catalog, 500)}'); // → mouse + keyboard
}

// ── MODEL ────────────────────────────────────────────────────
class Product {
  final int id;
  final String title;
  final double price;

  const Product({required this.id, required this.title, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(), // num handles int OR double
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'price': price};

  Product copyWith({int? id, String? title, double? price}) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
    );
  }

  @override
  String toString() => 'Product($title — \$$price)';
}

// ── SERVICE ──────────────────────────────────────────────────
class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(Duration(milliseconds: 500)); // fake network

    final List<Map<String, dynamic>> response = [
      {'id': 1, 'title': 'Monitor', 'price': 1200.0},
      {'id': 2, 'title': 'Mouse', 'price': 24.0},
      {'id': 3, 'title': 'Keyboard', 'price': 500.0},
    ];

    return response.map((json) => Product.fromJson(json)).toList();
  }

  // sum all prices with fold (like reduce but with a start value)
  double totalValue(List<Product> items) {
    return items.fold(0, (sum, p) => sum + p.price);
  }

  // keep only products cheaper than max
  List<Product> under(List<Product> items, double max) {
    return items.where((p) => p.price < max).toList();
  }
}
