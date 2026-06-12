// ============================================================
//  Lesson 08 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  double? discount;                          // null
  double price = 100 - (discount ?? 0);      // null → use 0
  print(price);                              // → 100.0

  // ── TASK 2 ────────────────────────────────────────────────
  String? email = getEmail();
  print(email?.length ?? 0);                 // → 0

  // ── TASK 3 ────────────────────────────────────────────────
  String? userInput = getInput();
  userInput ??= 'default';                   // assign because null
  print(userInput);                          // → default

  // ── TASK 4 ────────────────────────────────────────────────
  greetUser('Rasel');                        // → Hello, Rasel!
  greetUser(null);                           // → Hello, stranger!

  // ── TASK 5 ────────────────────────────────────────────────
  List<int?> rawScores = [80, null, 95, null, 60];

  // 1) remove nulls
  List<int> clean = rawScores.whereType<int>().toList();
  print(clean);                              // → [80, 95, 60]

  // 2) sum
  print(clean.reduce((a, b) => a + b));      // → 235

  // 3) how many removed
  print(rawScores.length - clean.length);    // → 2
}

// helpers returning null to simulate missing data
String? getEmail() => null;
String? getInput() => null;

// Task 4 — null check promotes name to String inside the if
void greetUser(String? name) {
  if (name != null) {
    print('Hello, $name!');    // name is plain String here
  } else {
    print('Hello, stranger!');
  }
}
