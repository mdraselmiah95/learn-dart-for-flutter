// ============================================================
//  DART FUNDAMENTALS — Full Overview
//  Read this once → understand whole Dart language structure
// ============================================================

// ── 1. ENTRY POINT ──────────────────────────────────────────
// Every Dart program MUST have main() — execution starts here
// void means this function returns nothing
void main() {

  // ── 2. COMMENTS ───────────────────────────────────────────
  // Single-line: everything after '//' is ignored by Dart
  /* Multi-line: everything between these symbols is ignored */
  /// Doc comment: shown in IDE tooltips, used to generate docs

  // ── 3. PRINT ──────────────────────────────────────────────
  print('Hello, Dart!');              // prints text to console
  print('2 + 3 = ${2 + 3}');         // ${} runs code inside a string

  // ── 4. VARIABLES ──────────────────────────────────────────
  var name     = 'Rasel';            // var: Dart guesses type (String here)
  String city  = 'Dhaka';           // String: explicit — stores text
  int age      = 25;                 // int: whole numbers only (no decimal)
  double gpa   = 3.9;               // double: numbers with decimal point
  bool isStudent = true;             // bool: only true or false

  dynamic anything = 'can be any type'; // dynamic = no fixed type
  // unlike var, dynamic CAN change type later:
  // anything = 42;      → OK (now int)
  // anything = true;    → OK (now bool)
  // anything = [1,2,3]; → OK (now List)
  // WARNING: no type checking — errors show at runtime, not compile time
  // Use only when type truly unknown (e.g. JSON from API)

  final String country = 'Bangladesh'; // final: set once, never change again
  const double pi = 3.14159;           // const: same as final BUT known at compile time
                                       // rule: prefer const > final > var

  String? nullable = null;             // '?' after type = allows null value
                                       // without '?', null causes compile error

  late String lateVar;                 // late: promise to assign before using
  lateVar = 'assigned later';          // must assign before first read or crash

  print('$name, $city, $age, $gpa, $isStudent');  // '$var' inserts value in string
  print('$country, $pi, $nullable, $lateVar');

  // ── 5. DATA TYPES ─────────────────────────────────────────
  // Collections: hold multiple values

  List<String> fruits = ['Apple', 'Banana', 'Mango']; // List: ordered, allows duplicates
                                                       // <String> = only Strings allowed inside
  Map<String, int> marks = {'Math': 90, 'English': 85}; // Map: key → value pairs
                                                         // like a dictionary

  Set<int> unique = {1, 2, 3, 3}; // Set: unordered, NO duplicates → stores {1, 2, 3}

  print(fruits);  // [Apple, Banana, Mango]
  print(marks);   // {Math: 90, English: 85}
  print(unique);  // {1, 2, 3}

  // ── 6. OPERATORS ──────────────────────────────────────────

  // Arithmetic — math operations
  print(10 + 3);  // 13  — add
  print(10 - 3);  // 7   — subtract
  print(10 * 3);  // 30  — multiply
  print(10 / 3);  // 3.333.. — divide (always returns double)
  print(10 ~/ 3); // 3   — integer divide (drops decimal)
  print(10 % 3);  // 1   — modulo (remainder after divide)

  // Comparison — always returns bool (true/false)
  print(5 > 3);   // true  — greater than
  print(5 == 5);  // true  — equal (use == not =)
  print(5 != 4);  // true  — not equal

  // Logical — combine bool values
  print(true && false); // false — AND: BOTH must be true
  print(true || false); // true  — OR: at least ONE must be true
  print(!true);         // false — NOT: flips the bool

  // Null-aware — handle null safely
  String? val = null;
  print(val ?? 'default'); // ?? = "use this if left side is null" → prints 'default'
  val ??= 'assigned';      // ??= = "assign only if currently null"

  // ── 7. CONTROL FLOW ───────────────────────────────────────

  // if / else if / else — run different code based on condition
  int score = 75;
  if (score >= 90) {        // if this is true → run this block
    print('A');
  } else if (score >= 70) { // else check this condition
    print('B');             // score=75 → prints 'B'
  } else {                  // none of the above matched
    print('C');
  }

  // switch — cleaner than many if/else, matches exact values
  String day = 'Mon';
  switch (day) {
    case 'Mon':             // if day == 'Mon'
      print('Monday');
      break;                // MUST break or falls into next case
    case 'Fri':
      print('Friday');
      break;
    default:                // no case matched → default runs
      print('Other day');
  }

  // Ternary — short if/else in one line
  // condition ? valueIfTrue : valueIfFalse
  String result = score >= 50 ? 'Pass' : 'Fail'; // score=75 → 'Pass'
  print(result);

  // ── 8. LOOPS ──────────────────────────────────────────────

  // for — run fixed number of times
  // (start; condition to keep running; step each time)
  for (int i = 0; i < 3; i++) { // i goes 0,1,2 then stops
    print('for: $i');
  }

  // for-in — loop through every item in a collection
  for (var fruit in fruits) { // fruit = each item one by one
    print('fruit: $fruit');
  }

  // while — keep looping WHILE condition is true
  int count = 0;
  while (count < 3) {       // check condition BEFORE each loop
    print('while: $count');
    count++;                 // count++ same as count = count + 1
  }

  // do-while — like while BUT runs at least once (checks after)
  int n = 0;
  do {
    print('do-while: $n');
    n++;
  } while (n < 3); // condition checked AFTER body runs

  // break & continue — control loop flow
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue; // skip this iteration, go to next
    if (i == 4) break;    // exit the loop completely
    print('loop: $i');    // prints: 0, 1, 3
  }

  // ── 9. FUNCTIONS ──────────────────────────────────────────
  // Functions defined outside main() — scroll down to see them

  print(add(3, 4));            // positional: pass values in order → 7
  print(greet(name: 'Rasel')); // named param: use label when calling → 'Hello, Rasel!'
  print(square(5));            // returns 25

  // Anonymous function — function without a name, stored in variable
  var multiply = (int a, int b) => a * b; // => means "return this"
  print(multiply(3, 4)); // 12

  // Higher-order function — pass a function as argument
  List<int> nums = [1, 2, 3, 4, 5];
  var doubled = nums.map((n) => n * 2).toList(); // map runs function on each item
  print(doubled); // [2, 4, 6, 8, 10]

  // ── 10. NULL SAFETY ───────────────────────────────────────
  // Dart guarantees no null errors IF you handle nullable types
  String? maybeNull = null;
  print(maybeNull?.length);      // ?. = safe call: returns null if maybeNull is null
                                  //     without ?. it would CRASH
  print(maybeNull?.length ?? 0); // combine ?. with ?? for safe fallback → prints 0

  // ! = force unwrap: tells Dart "trust me, it's not null"
  // DANGEROUS — crashes if wrong. Avoid unless 100% sure
  // String notNull = maybeNull!; // would crash here since maybeNull IS null

  // ── 11. CLASSES & OOP ─────────────────────────────────────
  // Class = blueprint for creating objects
  var person = Person('Rasel', 25); // create object from Person class
  print(person.greetPerson());      // call method on object

  var student = Student('Miah', 20, 'CSE'); // Student extends Person
  print(student.greetPerson()); // calls overridden version in Student

  // ── 12. COLLECTIONS METHODS ───────────────────────────────
  List<int> numbers = [5, 3, 8, 1, 9, 2];

  numbers.sort();                               // sort in place: [1,2,3,5,8,9]
  print(numbers);

  print(numbers.where((n) => n > 4).toList()); // where = filter → [5, 8, 9]
  print(numbers.reduce((a, b) => a + b));      // reduce = collapse to one value → 28

  Map<String, int> scores = {'Ali': 80, 'Bob': 95};
  scores.forEach((k, v) => print('$k: $v'));   // loop through map key-value pairs

  // ── 13. EXCEPTION HANDLING ────────────────────────────────
  // try/catch = catch errors so app doesn't crash
  try {
    int bad = int.parse('abc'); // 'abc' can't become int → throws FormatException
    print(bad);                 // this line never runs if above throws
  } on FormatException catch (e) { // catch specific error type
    print('Format error: $e');
  } catch (e) {                    // catch ANY other error
    print('Unknown error: $e');
  } finally {
    print('finally always runs');  // runs whether error happened or not
  }

  // ── 14. ASYNC / AWAIT ─────────────────────────────────────
  // Problem: some tasks take time (network, file read)
  // async/await lets Dart wait without freezing the app
  // Future<T> = "will give you a T value in the future"
  // async = marks function as asynchronous
  // await = pause here until Future completes
  fetchData(); // starts running but doesn't block this line

  print('\n--- Dart Fundamentals Complete ---');
}

// ── FUNCTIONS (outside main) ────────────────────────────────

// returnType functionName(paramType paramName)
int add(int a, int b) => a + b;  // => shorthand for { return a + b; }

// {} around param = named param, 'required' = must pass it
String greet({required String name}) => 'Hello, $name!';

int square(int x) {
  return x * x; // full function body with return keyword
}

// Future<void> = async function that returns nothing
Future<void> fetchData() async {
  await Future.delayed(Duration(seconds: 1)); // wait 1 second (simulates API call)
  print('async: data fetched!');              // runs after 1 second
}

// ── CLASSES ─────────────────────────────────────────────────
// class = blueprint | object = instance built from blueprint
class Person {
  String name; // property (field)
  int age;

  Person(this.name, this.age); // constructor: 'this.name' auto-assigns param to field

  String greetPerson() => 'I am $name, age $age'; // method
}

// 'extends' = inheritance: Student gets everything Person has
class Student extends Person {
  String major; // extra property only Student has

  // 'super(name, age)' calls Person's constructor first
  Student(String name, int age, this.major) : super(name, age);

  @override // tells Dart: replacing parent's version
  String greetPerson() => 'Student $name, major: $major';
}

// ── ABSTRACT CLASS ──────────────────────────────────────────
// abstract = cannot create object directly, only used as base
abstract class Animal {
  void makeSound(); // no body — subclass MUST implement this
}

class Dog extends Animal {
  @override
  void makeSound() => print('Woof!'); // Dog provides its own implementation
}

// ── MIXIN ────────────────────────────────────────────────────
// mixin = reusable block of methods, added to class with 'with'
// useful when you want shared behavior without full inheritance
mixin CanFly {
  void fly() => print('Flying!');
}

// Bird extends Animal AND gets CanFly methods via mixin
class Bird extends Animal with CanFly {
  @override
  void makeSound() => print('Tweet!');
}
