// ============================================================
//  Lesson 07 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  List<int> numbers = [42, 7, 19, 3, 88];
  print('First: ${numbers.first}');    // → 42
  print('Last: ${numbers.last}');      // → 88
  print('Length: ${numbers.length}');  // → 5
  numbers.sort();
  print('Sorted: $numbers');           // → [3, 7, 19, 42, 88]

  // ── TASK 2 ────────────────────────────────────────────────
  List<String> cart = ['Milk', 'Bread', 'Eggs'];
  cart.add('Butter');
  cart.remove('Bread');
  cart.insert(0, 'Rice');
  print('Cart: $cart');                       // → [Rice, Milk, Eggs, Butter]
  print('Has milk: ${cart.contains('Milk')}'); // → true

  // ── TASK 3 ────────────────────────────────────────────────
  List<int> withDupes = [3, 7, 3, 9, 7, 1];
  List<int> unique = withDupes.toSet().toList(); // Set removes duplicates
  print('Unique: $unique');            // → [3, 7, 9, 1]

  // ── TASK 4 ────────────────────────────────────────────────
  Map<String, int> products = {
    'Pen': 10,
    'Notebook': 50,
    'Eraser': 5,
    'Ruler': 15,
  };
  print('Products: ${products.keys}'); // 1) all names
  products['Marker'] = 30;             // 2) add new
  products['Pen'] = 12;                // 3) update price
  int total = products.values.reduce((a, b) => a + b); // 4) sum
  print('Total: $total');              // → 112

  // ── TASK 5 ────────────────────────────────────────────────
  List<int> scores = [55, 80, 92, 38, 70, 45];

  // 1) passing scores only
  print(scores.where((s) => s >= 50).toList()); // → [55, 80, 92, 70]

  // 2) average = sum / count
  double avg = scores.reduce((a, b) => a + b) / scores.length;
  print('Average: $avg');              // → 63.33...

  // 3) anyone 90+?
  print(scores.any((s) => s >= 90));   // → true

  // 4) map each score to Pass/Fail
  List<String> results = scores.map((s) => s >= 50 ? 'Pass' : 'Fail').toList();
  print(results); // → [Pass, Pass, Pass, Fail, Pass, Fail]
}
