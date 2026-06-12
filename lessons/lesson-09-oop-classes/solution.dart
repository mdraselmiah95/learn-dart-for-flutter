// ============================================================
//  Lesson 09 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  Book b1 = Book('Clean Code', 'Robert Martin', 35.0);
  Book b2 = Book('Dart Apprentice', 'Jonathan Sande', 28.5);
  print(b1.title);  // → Clean Code
  print(b2.title);  // → Dart Apprentice

  // ── TASK 2 ────────────────────────────────────────────────
  b1.summary();     // → Clean Code by Robert Martin — $35.0
  b2.summary();     // → Dart Apprentice by Jonathan Sande — $28.5

  // ── TASK 3 ────────────────────────────────────────────────
  Book freebie = Book.free('Dart Basics', 'Community');
  freebie.summary(); // → Dart Basics by Community — $0.0

  // ── TASK 4 ────────────────────────────────────────────────
  Counter counter = Counter();
  counter.increment();
  counter.increment();
  counter.increment();
  print(counter.count);  // → 3
  counter.reset();
  print(counter.count);  // → 0

  // ── TASK 5 ────────────────────────────────────────────────
  const square = Rectangle(4, 4);
  const rect = Rectangle(3, 5);
  print(square);            // → Rectangle(4.0 x 4.0)
  print(square.area);       // → 16.0
  print(square.isSquare);   // → true
  print(rect.area);         // → 15.0
  print(rect.isSquare);     // → false
}

// ── Tasks 1–3 ────────────────────────────────────────────────
class Book {
  String title;
  String author;
  double price;

  Book(this.title, this.author, this.price);

  // named constructor — price fixed to 0
  Book.free(this.title, this.author) : price = 0;

  void summary() {
    print('$title by $author — \$$price'); // \$ prints a literal $
  }
}

// ── Task 4 ───────────────────────────────────────────────────
class Counter {
  int _count = 0;              // private — outside code can't set it

  int get count => _count;     // read-only access

  void increment() => _count++;
  void reset() => _count = 0;
}

// ── Task 5 ───────────────────────────────────────────────────
class Rectangle {
  final double width;
  final double height;

  const Rectangle(this.width, this.height);

  double get area => width * height;
  bool get isSquare => width == height;

  @override
  String toString() => 'Rectangle($width x $height)';
}
