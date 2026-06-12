// ============================================================
//  Lesson 01 — Introduction to Dart
//  Topics: main(), print(), comments, string interpolation
// ============================================================

// void   = this function returns nothing
// main() = every Dart program starts here — required
void main() {

  // ── PRINT ─────────────────────────────────────────────────
  print('Hello, Dart!');               // print() outputs to console
  print('Welcome to learn-dart-for-flutter');

  // ── STRING INTERPOLATION ───────────────────────────────────
  // Use $variableName to insert a variable inside a string
  String name = 'Rasel';
  print('My name is $name');           // → My name is Rasel

  // Use ${expression} to run code inside a string
  print('1 + 1 = ${1 + 1}');          // → 1 + 1 = 2
  print('Name length: ${name.length}'); // → Name length: 5

  // ── COMMENTS ──────────────────────────────────────────────
  // This is a single-line comment — Dart ignores this line

  /*
    This is a multi-line comment.
    Use it for longer explanations.
    Dart ignores everything between the symbols.
  */

  /// This is a documentation comment.
  /// Use it above functions and classes.
  /// Your IDE shows it as a tooltip when you hover over the function.

  // ── CALLING A FUNCTION ────────────────────────────────────
  greet('World');                      // call the greet function defined below
  greet('Flutter Developer');

  // ── MULTIPLE PRINTS ───────────────────────────────────────
  print('---');
  print('Dart is:');
  print('  - Strongly typed');
  print('  - Compiled');
  print('  - Built for Flutter');
}

// ── FUNCTIONS (defined outside main) ────────────────────────
// String name = parameter: function expects a String value
// void        = function returns nothing
void greet(String name) {
  print('Hello, $name!');             // uses the passed-in name
}

// ── KEY RULES ────────────────────────────────────────────────
// 1. Every statement ends with a semicolon ;
// 2. main() is always the entry point
// 3. Functions can be defined before OR after main()
// 4. Dart is case-sensitive: 'Name' != 'name'
