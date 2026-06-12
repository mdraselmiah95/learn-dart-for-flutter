// ============================================================
//  Lesson 03 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  int a = 17;
  int b = 5;
  print('Sum: ${a + b}');          // → 22
  print('Difference: ${a - b}');   // → 12
  print('Product: ${a * b}');      // → 85
  print('Division: ${a / b}');     // → 3.4
  print('Int division: ${a ~/ b}');// → 3
  print('Remainder: ${a % b}');    // → 2

  // ── TASK 2 ────────────────────────────────────────────────
  int points = 100;
  points += 50;          // 150
  print('After +=: $points');
  points -= 30;          // 120
  print('After -=: $points');
  points *= 2;           // 240
  print('After *=: $points');      // → 240

  // ── TASK 3 ────────────────────────────────────────────────
  int age = 20;
  bool hasTicket = true;
  bool canEnter = age >= 18 && hasTicket; // both must be true
  print('Can enter: $canEnter');   // → true

  // ── TASK 4 ────────────────────────────────────────────────
  String? userCity;
  print(userCity ?? 'Unknown');    // → Unknown
  userCity ??= 'Dhaka';            // assigns because it was null
  print(userCity);                 // → Dhaka

  // ── TASK 5 ────────────────────────────────────────────────
  int seconds = 3750;
  int hours = seconds ~/ 3600;          // 3750 / 3600 = 1 hour
  int minutes = (seconds % 3600) ~/ 60; // leftover 150s / 60 = 2 min
  int secs = seconds % 60;              // leftover = 30s
  print('${hours}h ${minutes}m ${secs}s'); // → 1h 2m 30s
}
