// ============================================================
//  Lesson 03 — Operators
//  Topics: arithmetic, assignment, comparison, logical,
//          null-aware, type test operators
// ============================================================

void main() {

  // ── 1. ARITHMETIC OPERATORS ───────────────────────────────
  int a = 10;
  int b = 3;

  print(a + b);   // → 13   addition
  print(a - b);   // → 7    subtraction
  print(a * b);   // → 30   multiplication
  print(a / b);   // → 3.33 division (ALWAYS returns double)
  print(a ~/ b);  // → 3    integer division (drops decimal)
  print(a % b);   // → 1    modulo (remainder of division)

  // ── 2. ASSIGNMENT OPERATORS ───────────────────────────────
  int x = 5;      // basic assignment
  x += 3;         // same as x = x + 3 → 8
  print(x);       // → 8
  x -= 2;         // same as x = x - 2 → 6
  print(x);       // → 6
  x *= 2;         // same as x = x * 2 → 12
  print(x);       // → 12

  // Increment and decrement
  int count = 0;
  count++;        // add 1 → same as count = count + 1
  count++;
  print(count);   // → 2
  count--;        // subtract 1
  print(count);   // → 1

  // ── 3. COMPARISON OPERATORS ───────────────────────────────
  // Always return bool (true/false)
  print(5 == 5);  // → true   equal (NOT = which is assignment!)
  print(5 != 4);  // → true   not equal
  print(5 > 3);   // → true   greater than
  print(5 < 3);   // → false  less than
  print(5 >= 5);  // → true   greater than or equal
  print(5 <= 4);  // → false  less than or equal

  // ── 4. LOGICAL OPERATORS ──────────────────────────────────
  // fromUser() simulates input Dart can't predict (defined below main)
  bool isLoggedIn = fromUser(true);
  bool isAdmin = fromUser(false);

  // && AND — both sides must be true
  print(isLoggedIn && isAdmin);  // → false

  // || OR — at least one side must be true
  print(isLoggedIn || isAdmin);  // → true

  // ! NOT — flips the value
  print(!isAdmin);               // → true

  // Real example: access control
  bool canEdit = isLoggedIn && isAdmin;
  print('Can edit: $canEdit');   // → Can edit: false

  // ── 5. NULL-AWARE OPERATORS ───────────────────────────────
  // loadUsername() returns String? — might be null (defined below main)
  String? username = loadUsername();

  // ?? — use right side if left side is null
  print(username ?? 'Guest');    // → Guest

  // ??= — assign only if currently null
  username ??= 'Rasel';
  print(username);               // → Rasel
  // if we run username ??= 'Other' now, nothing happens — already not null

  // ?. — call method/property only if not null (Lesson 08 covers more)
  String? maybeName = loadUsername();
  print(maybeName?.length);      // → null (no crash!)

  // ── 6. TYPE TEST OPERATORS ────────────────────────────────
  dynamic value = 'Hello';

  print(value is String);   // → true   'is' checks the type
  print(value is int);      // → false
  print(value is! int);     // → true   'is!' means "is NOT"

  // 'as' casts a value to a specific type
  dynamic raw = 'Dart';
  String text = raw as String; // tell Dart: treat raw as String
  print(text.toUpperCase());   // → DART

  // ── 7. OPERATOR PRECEDENCE ────────────────────────────────
  // Multiplication runs before addition — like math class
  print(2 + 3 * 4);    // → 14 (not 20)
  print((2 + 3) * 4);  // → 20 (parentheses first)
}

// Simulates loading a username — returns null (user not logged in)
String? loadUsername() {
  return null;
}

// Simulates user input — Dart can't predict the value at compile time
bool fromUser(bool value) {
  return value;
}
