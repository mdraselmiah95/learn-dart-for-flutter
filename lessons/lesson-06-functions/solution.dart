// ============================================================
//  Lesson 06 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  print(isEven(4));   // → true
  print(isEven(7));   // → false

  // ── TASK 2 ────────────────────────────────────────────────
  double result = bmi(weightKg: 70, heightM: 1.75);
  print('BMI: ${result.toStringAsFixed(1)}'); // → BMI: 22.9

  // ── TASK 3 ────────────────────────────────────────────────
  print(celsiusToFahrenheit(0));    // → 32.0
  print(celsiusToFahrenheit(25));   // → 77.0
  print(celsiusToFahrenheit(100));  // → 212.0

  // ── TASK 4 ────────────────────────────────────────────────
  List<int> prices = [120, 45, 89, 200, 15];
  var withTax = prices
      .where((p) => p > 50)          // keep: 120, 89, 200
      .map((p) => p * 1.1)           // add 10% tax
      .toList();
  print(withTax);  // → [132.0, 97.9, 220.0...]

  // ── TASK 5 ────────────────────────────────────────────────
  var tens = applyToAll([1, 2, 3], (n) => n * 10);
  print(tens);     // → [10, 20, 30]
}

// Task 1 — arrow function returning bool
bool isEven(int n) => n % 2 == 0;

// Task 2 — named required parameters, returns double
double bmi({required double weightKg, required double heightM}) {
  return weightKg / (heightM * heightM);
}

// Task 3 — arrow function with formula
double celsiusToFahrenheit(double c) => c * 9 / 5 + 32;

// Task 5 — higher-order function built with a loop
List<int> applyToAll(List<int> items, int Function(int) fn) {
  List<int> result = [];        // start with empty list
  for (int item in items) {
    result.add(fn(item));       // apply fn to each item
  }
  return result;
}
