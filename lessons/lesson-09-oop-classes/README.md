# Lesson 09 — OOP: Classes & Objects

## Learning Objectives

By the end of this lesson you will:
- Create classes with properties, methods, and constructors
- Use named constructors for alternative creation paths
- Protect data with private fields, getters, and setters
- Build immutable objects with `final` + `const` constructors

---

## Class = Blueprint, Object = Instance

```dart
class Person {
  String name;                    // property (field)
  int age;

  Person(this.name, this.age);    // constructor — this. auto-assigns!

  void sayHello() {               // method
    print('Hi, I am $name');
  }
}

// build objects from the blueprint:
Person rasel = Person('Rasel', 25);
rasel.sayHello();                 // → Hi, I am Rasel
rasel.age = 26;                   // properties are mutable by default
```

`Person(this.name, this.age)` is Dart's shorthand — no constructor body needed.

---

## Named Constructors

A class can offer multiple ways to be created:

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Person.guest()                  // alternative path
      : name = 'Guest',
        age = 0;
}

Person g = Person.guest();
```

---

## Private Fields + Getters

`_underscore` = private to this file. Protect fields from invalid changes:

```dart
class BankAccount {
  double _balance = 0;            // outside code CANNOT touch this

  double get balance => _balance; // read-only window

  void deposit(double amount) {
    if (amount <= 0) return;      // guard against bad input
    _balance += amount;
  }
}
```

Getters are called like properties: `account.balance` — no `()`.

---

## toString Override

```dart
@override
String toString() => 'Person($name, $age)';

print(rasel);   // → Person(Rasel, 25) instead of 'Instance of Person'
```

---

## Immutable Objects — the Flutter way

All fields `final` + `const` constructor = object can never change:

```dart
class Point {
  final int x;
  final int y;
  const Point(this.x, this.y);
}

const origin = Point(0, 0);
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| forgetting `this.` in constructor shorthand | params don't reach the fields |
| public fields everyone can corrupt | use `_private` + getter + guarded methods |
| calling a getter with `()` | getters are property-style: `obj.balance` |
| `const` constructor with non-final fields | won't compile — all fields must be final |

---

## Flutter Connection

**Every Flutter widget is a class.** This lesson is the single most important one for reading Flutter code:

```dart
class MyCard extends StatelessWidget {     // a class!
  final String title;                      // final field!
  const MyCard({required this.title});     // const constructor + named params!
  ...
}
```

That one line of Flutter uses: class, final, const constructor, named required params — all from this lesson. The `const Text('hi')` you'll see everywhere? Immutable widget objects — Flutter skips rebuilding them. Free performance.

---

## Summary

- `class` bundles data (fields) + behavior (methods)
- `ClassName(this.field)` — constructor shorthand
- `_private` + `get` = controlled access
- `final` fields + `const` constructor = immutable = Flutter's default style

---

## How to Run

```bash
dart run lessons/lesson-09-oop-classes/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 08 — Null Safety](../lesson-08-null-safety/) · [Lesson 10 — Inheritance & Mixins](../lesson-10-inheritance-abstract-mixin/) ➡
