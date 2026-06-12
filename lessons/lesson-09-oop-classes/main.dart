// ============================================================
//  Lesson 09 — OOP: Classes & Objects
//  Topics: class, object, constructor, named constructor,
//          getters/setters, private fields, toString, factory
// ============================================================

void main() {

  // ── 1. CREATING OBJECTS ───────────────────────────────────
  // A class is a blueprint; an object is a thing built from it
  Person rasel = Person('Rasel', 25);   // calls the constructor
  Person miah = Person('Miah', 30);     // a second, separate object

  print(rasel.name);              // → Rasel (access a property)
  print(miah.age);                // → 30
  rasel.sayHello();               // → Hi, I am Rasel (call a method)
  miah.sayHello();                // → Hi, I am Miah

  // ── 2. MODIFYING PROPERTIES ───────────────────────────────
  rasel.age = 26;                 // properties can be changed
  print(rasel.age);               // → 26
  rasel.haveBirthday();           // methods can change properties too
  print(rasel.age);               // → 27

  // ── 3. NAMED CONSTRUCTOR ──────────────────────────────────
  Person guest = Person.guest();  // alternative way to create
  print(guest.name);              // → Guest

  // ── 4. GETTERS AND SETTERS ────────────────────────────────
  BankAccount account = BankAccount('Rasel');

  account.deposit(500);
  print(account.balance);         // → 500.0 (getter — looks like a property)

  account.deposit(-100);          // invalid — rejected by the method
  print(account.balance);         // → 500.0 (unchanged)

  // account._balance = 9999;     // ← impossible: _balance is private!

  // ── 5. toString ───────────────────────────────────────────
  // Without toString: prints 'Instance of Person'
  // With our override: prints something useful
  print(rasel);                   // → Person(Rasel, 27)

  // ── 6. const CONSTRUCTOR + IMMUTABLE OBJECTS ──────────────
  // All fields final → object can never change after creation
  const origin = Point(0, 0);
  print(origin);                  // → Point(0, 0)
  // Flutter widgets work exactly like this — that's why
  // you see 'const Text(...)' everywhere in Flutter!
}

// ── CLASS DEFINITIONS ────────────────────────────────────────

class Person {
  // Properties (also called fields)
  String name;
  int age;

  // Constructor — 'this.name' assigns the parameter to the field
  Person(this.name, this.age);

  // Named constructor — a second way to build a Person
  Person.guest()
      : name = 'Guest',
        age = 0;

  // Methods — functions that belong to the class
  void sayHello() {
    print('Hi, I am $name');     // can use the object's own fields
  }

  void haveBirthday() {
    age++;                       // methods can modify fields
  }

  // Override toString so print() shows useful info
  @override
  String toString() => 'Person($name, $age)';
}

class BankAccount {
  String owner;

  // _underscore = PRIVATE — only this file can touch it.
  // Protects the field from invalid outside changes.
  double _balance = 0;

  BankAccount(this.owner);

  // Getter — read-only access to the private field
  // Called WITHOUT parentheses: account.balance
  double get balance => _balance;

  // Method that guards the field — rejects bad input
  void deposit(double amount) {
    if (amount <= 0) {
      print('Invalid amount: $amount');
      return;                    // exit without changing anything
    }
    _balance += amount;
  }
}

// Immutable class — all fields final, const constructor
class Point {
  final int x;
  final int y;

  const Point(this.x, this.y);   // const = can be compile-time constant

  @override
  String toString() => 'Point($x, $y)';
}
