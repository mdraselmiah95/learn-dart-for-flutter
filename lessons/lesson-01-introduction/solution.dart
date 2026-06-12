// ============================================================
//  Lesson 01 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  String myName = 'Rasel';
  print('My name is $myName');

  // ── TASK 2 ────────────────────────────────────────────────
  String city = 'Dhaka';
  print('I live in $city');

  // ── TASK 3 ────────────────────────────────────────────────
  print('10 x 5 = ${10 * 5}');        // → 10 x 5 = 50

  // ── TASK 4 ────────────────────────────────────────────────
  introduce('Rasel', 25);

  // ── TASK 5 ────────────────────────────────────────────────
  print('**********');
  print('*  Dart  *');
  print('**********');
}

// Task 4 solution — function takes name (String) and age (int)
void introduce(String name, int age) {
  print('Hi! I am $name and I am $age years old.');
}
