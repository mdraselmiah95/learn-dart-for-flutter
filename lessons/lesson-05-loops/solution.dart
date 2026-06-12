// ============================================================
//  Lesson 05 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  for (int i = 1; i <= 10; i++) {
    print('7 x $i = ${7 * i}');
  }

  // ── TASK 2 ────────────────────────────────────────────────
  List<String> cities = ['Dhaka', 'Chittagong', 'Sylhet', 'Khulna', 'Rajshahi'];
  for (int i = 0; i < cities.length; i++) {
    print('${i + 1}. ${cities[i]}');  // i starts at 0, so display i+1
  }

  // ── TASK 3 ────────────────────────────────────────────────
  int total = 0;
  for (int i = 1; i <= 100; i++) {
    total += i;              // add each number to the running total
  }
  print('Total: $total');    // → Total: 5050

  // ── TASK 4 ────────────────────────────────────────────────
  for (int i = 1; i <= 20; i++) {
    if (i == 15) break;      // stop completely at 15
    if (i % 3 == 0) continue; // skip multiples of 3
    print(i);
  }
  // → 1 2 4 5 7 8 10 11 13 14

  // ── TASK 5 ────────────────────────────────────────────────
  for (int i = 1; i <= 15; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');     // check BOTH first — order matters!
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }
}
