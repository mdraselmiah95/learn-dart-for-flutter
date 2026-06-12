// ============================================================
//  Lesson 12 — Practice Tasks
//  Build a Product catalog — the same patterns as main.dart
// ============================================================

Future<void> main() async {

  // ── TASK 1 ────────────────────────────────────────────────
  // Create a Product model class with:
  // - final int id, final String title, final double price
  // - const constructor with named required parameters
  // - toString override: 'Product(title — $price)'
  // Create one product in main and print it.


  // ── TASK 2 ────────────────────────────────────────────────
  // Add factory Product.fromJson(Map<String, dynamic> json)
  // and Map<String, dynamic> toJson().
  // Test: build a product from this map and print it:
  // {'id': 1, 'title': 'Laptop', 'price': 999.99}


  // ── TASK 3 ────────────────────────────────────────────────
  // Add copyWith to Product.
  // Create a discounted copy of your product (price * 0.8)
  // and print both — original must be unchanged.


  // ── TASK 4 ────────────────────────────────────────────────
  // Create a ProductService class with:
  // Future<List<Product>> fetchProducts() that:
  // - waits 500ms
  // - returns 3 products built with fromJson from a JSON list
  // Await it in main and print each product.


  // ── TASK 5 (Challenge) ────────────────────────────────────
  // Add to ProductService:
  // - double totalValue(List<Product> items) → sum of prices
  // - List<Product> under(List<Product> items, double max)
  //   → only products cheaper than max
  // Print the total and the filtered list.

}
