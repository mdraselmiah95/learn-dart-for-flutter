// ============================================================
//  Lesson 02 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  String fullName  = 'Rasel Miah';
  int    myAge     = 25;
  double gpa       = 3.9;
  bool   isStudent = true;
  print('$fullName | $myAge | $gpa | $isStudent');

  // ── TASK 2 ────────────────────────────────────────────────
  const int startYear = 2026;
  final String todayGreeting = 'Good morning! Today is a great day to learn Dart.';
  print('Started Dart: $startYear');
  print(todayGreeting);

  // ── TASK 3 ────────────────────────────────────────────────
  String? middleName = null;
  print('Middle name: $middleName');     // → Middle name: null
  middleName = 'Ahmed';
  print('Middle name: $middleName');     // → Middle name: Ahmed

  // ── TASK 4 ────────────────────────────────────────────────
  List<String> languages = ['Dart', 'JavaScript', 'Python'];
  print('Languages: $languages');
  print('First: ${languages[0]}');
  print('Count: ${languages.length}');

  // ── TASK 5 ────────────────────────────────────────────────
  Map<String, int> marks = {
    'Math':    92,
    'English': 88,
    'Science': 95,
  };
  print('Marks: $marks');
  print('Math: ${marks['Math']}');      // → Math: 92

  // ── TASK 6 ────────────────────────────────────────────────
  String numStr  = '100';
  int    parsed  = int.parse(numStr);   // '100' → 100
  int    doubled = parsed * 2;          // 100 * 2 = 200
  print('Doubled: $doubled');           // → 200
  String result  = doubled.toString();  // 200 → '200'
  print('String length: ${result.length}'); // → 3

  // ── TASK 7 ────────────────────────────────────────────────
  dynamic anything = 42;
  print('int: $anything');              // → int: 42
  anything = 'Hello Dart';
  print('String: $anything');           // → String: Hello Dart
  anything = [1, 2, 3];
  print('List: $anything');             // → List: [1, 2, 3]
}
