// ============================================================
//  Lesson 02 — Variables & Data Types
//  Topics: var, String, int, double, bool, dynamic,
//          final, const, nullable(?), late, List, Map, Set
// ============================================================

void main() {

  // ── 1. var — Dart infers the type ─────────────────────────
  var name = 'Rasel';      // Dart sees 'Rasel' → infers String
  var age  = 25;           // Dart sees 25      → infers int
  name = 'Miah';           // OK — still a String
  // name = 42;            // ERROR — cannot change to int after inference
  print('var: $name, $age');

  // ── 2. String — stores text ───────────────────────────────
  String city = 'Dhaka';
  String greeting = 'Hello, $city!';  // string interpolation
  String multiLine = '''
  This is
  a multi-line
  string''';                           // triple quotes for multi-line
  print('String: $greeting');
  print(multiLine);

  // ── 3. int — whole numbers (no decimal) ───────────────────
  int score    =  100;
  int negative = -50;
  int big      =  1000000;
  print('int: $score, $negative, $big');

  // ── 4. double — decimal numbers ───────────────────────────
  double price = 9.99;
  double pi    = 3.14159;
  print('double: $price, $pi');

  // ── 5. num — holds int OR double ──────────────────────────
  num a = 10;    // acts as int
  num b = 10.5;  // acts as double
  print('num: $a, $b');

  // ── 6. bool — only true or false ──────────────────────────
  bool isLoggedIn = true;
  bool hasError   = false;
  print('bool: $isLoggedIn, $hasError');

  // ── 7. dynamic — no fixed type, can change type ───────────
  dynamic data = 'Hello';         // starts as String
  print('dynamic (String): $data');
  data = 42;                      // now it is int — OK
  print('dynamic (int): $data');
  data = true;                    // now it is bool — OK
  print('dynamic (bool): $data');
  // WARNING: avoid dynamic unless truly necessary
  // Dart cannot catch type errors until runtime with dynamic

  // ── 8. final — assign once, never reassign ────────────────
  final String country = 'Bangladesh';
  // country = 'India';            // ERROR — cannot reassign final
  print('final: $country');

  // ── 9. const — compile-time constant ─────────────────────
  const double gravity   = 9.8;
  const int    maxUsers  = 100;
  const String appName   = 'LearnDart';
  // gravity = 10;                 // ERROR — cannot reassign const
  print('const: $gravity, $maxUsers, $appName');

  // final vs const:
  // final → value set at runtime  (e.g. DateTime.now() is OK)
  // const → value must be known at compile time (literals only)
  final DateTime now = DateTime.now(); // OK with final
  // const DateTime now2 = DateTime.now(); // ERROR with const
  print('final DateTime: $now');

  // ── 10. Nullable (?) — variable can hold null ─────────────
  String? nickname = null;  // '?' after type = null is allowed
  int?    score2;           // not assigned = null by default
  print('nullable: $nickname, $score2');

  nickname = 'Rash';        // can assign later
  print('nullable after assign: $nickname');

  // ── 11. late — declare now, assign before first use ───────
  late String description;
  // print(description);    // ERROR — would crash here (not assigned yet)
  description = 'Dart is awesome!';
  print('late: $description'); // now safe to use

  // ── 12. List — ordered collection, duplicates allowed ─────
  List<String> fruits  = ['Apple', 'Banana', 'Mango'];
  List<int>    numbers = [1, 2, 3, 4, 5];
  print('List: $fruits');
  print('List first item: ${fruits[0]}');   // index starts at 0
  print('List length: ${fruits.length}');

  // ── 13. Map — key-value pairs ─────────────────────────────
  Map<String, int> marks = {
    'Math':    90,
    'English': 85,
    'Science': 92,
  };
  print('Map: $marks');
  print('Math mark: ${marks['Math']}');     // access by key

  // ── 14. Set — unique values only, no duplicates ───────────
  Set<String> colors = {'Red', 'Green', 'Blue', 'Red'}; // 'Red' added twice
  print('Set: $colors'); // → {Red, Green, Blue} — 'Red' stored once

  // ── TYPE CONVERSION ───────────────────────────────────────
  String numStr = '42';
  int parsed    = int.parse(numStr);    // String → int
  double dbl    = double.parse('3.14'); // String → double
  String back   = parsed.toString();    // int → String
  print('Parsed: $parsed, $dbl, $back');
}
