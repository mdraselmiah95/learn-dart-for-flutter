// ============================================================
//  Lesson 06 — Functions
//  Topics: parameters, named params, optional params,
//          arrow functions, anonymous functions, higher-order
// ============================================================

void main() {

  // ── 1. BASIC FUNCTION ─────────────────────────────────────
  greet();                       // call it — runs the body below
  // → Hello from a function!

  // ── 2. PARAMETERS ─────────────────────────────────────────
  greetPerson('Rasel');          // pass a value in
  greetPerson('Miah');
  // → Hello, Rasel! / Hello, Miah!

  // ── 3. RETURN VALUES ──────────────────────────────────────
  int sum = add(3, 4);           // function gives a value back
  print('Sum: $sum');            // → Sum: 7
  print('Direct: ${add(10, 20)}'); // → Direct: 30

  // ── 4. NAMED PARAMETERS ───────────────────────────────────
  // Wrapped in {} — call them by name, order doesn't matter
  createUser(name: 'Rasel', age: 25);
  createUser(age: 30, name: 'Miah');  // reversed order — still works
  // Named params make calls readable — Flutter uses them EVERYWHERE

  // ── 5. OPTIONAL PARAMS WITH DEFAULTS ──────────────────────
  orderCoffee();                       // uses default
  orderCoffee(size: 'Large');          // overrides default
  // → Coffee: Medium / Coffee: Large

  // ── 6. ARROW FUNCTIONS ────────────────────────────────────
  // => is shorthand for { return ...; } — one expression only
  print(square(6));              // → 36
  print(isAdult(20));            // → true

  // ── 7. ANONYMOUS FUNCTIONS ────────────────────────────────
  // A function without a name — stored in a variable
  var multiply = (int a, int b) => a * b;
  print(multiply(4, 5));         // → 20

  // Often used directly as arguments (next section)

  // ── 8. HIGHER-ORDER FUNCTIONS ─────────────────────────────
  // Functions that take other functions as arguments
  List<int> numbers = [1, 2, 3, 4, 5];

  // map — transform every item, returns new list
  var doubled = numbers.map((n) => n * 2).toList();
  print(doubled);                // → [2, 4, 6, 8, 10]

  // where — keep only items that pass the test
  var evens = numbers.where((n) => n % 2 == 0).toList();
  print(evens);                  // → [2, 4]

  // reduce — collapse the list into one value
  var total = numbers.reduce((a, b) => a + b);
  print(total);                  // → 15

  // Passing your own function as an argument
  repeat(3, sayHi);              // pass sayHi itself — no () !
  // → Hi! Hi! Hi!

  // ── 9. FUNCTION AS RETURN VALUE ───────────────────────────
  var triple = makeMultiplier(3);  // returns a customized function
  print(triple(10));             // → 30
}

// ── FUNCTION DEFINITIONS ─────────────────────────────────────

// No parameters, no return value
void greet() {
  print('Hello from a function!');
}

// One positional parameter
void greetPerson(String name) {
  print('Hello, $name!');
}

// Returns an int — 'int' before the name is the return type
int add(int a, int b) {
  return a + b;
}

// Named parameters in {} — 'required' means caller MUST provide it
void createUser({required String name, required int age}) {
  print('User created: $name, age $age');
}

// Optional named param with a default value
void orderCoffee({String size = 'Medium'}) {
  print('Coffee: $size');
}

// Arrow functions — one-line shorthand
int square(int x) => x * x;
bool isAdult(int age) => age >= 18;
void sayHi() => print('Hi!');

// Higher-order: takes a function as a parameter
// 'void Function()' is the TYPE of a function with no params/return
void repeat(int times, void Function() action) {
  for (int i = 0; i < times; i++) {
    action();                    // call the passed-in function
  }
}

// Returns a function — the returned function "remembers" factor
int Function(int) makeMultiplier(int factor) {
  return (int x) => x * factor;
}
