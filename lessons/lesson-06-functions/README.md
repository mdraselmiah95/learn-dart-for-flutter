# Lesson 06 — Functions

## Learning Objectives

By the end of this lesson you will:
- Write functions with positional, named, and optional parameters
- Use arrow syntax for one-line functions
- Pass functions as arguments (the key to understanding Flutter)
- Transform lists with `map`, `where`, and `reduce`

---

## Anatomy of a Function

```dart
int add(int a, int b) {     // returnType name(params)
  return a + b;
}
```

No return value? Use `void`. One expression? Use arrow:

```dart
int square(int x) => x * x;     // => means "return this"
```

---

## Named Parameters — Flutter's favorite

Wrap params in `{}` → callers use labels, order doesn't matter:

```dart
void createUser({required String name, required int age}) { ... }

createUser(name: 'Rasel', age: 25);   // readable!
createUser(age: 25, name: 'Rasel');   // same thing
```

**Why this matters:** every Flutter widget uses named params:

```dart
Text('Hello', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)
```

Optional with default:

```dart
void orderCoffee({String size = 'Medium'}) { ... }
orderCoffee();               // Medium
orderCoffee(size: 'Large');  // Large
```

---

## Anonymous Functions

Functions without names — stored or passed directly:

```dart
var multiply = (int a, int b) => a * b;
print(multiply(3, 4));   // → 12
```

---

## Higher-Order Functions

Functions that **take or return** other functions:

```dart
List<int> numbers = [1, 2, 3, 4, 5];

numbers.map((n) => n * 2).toList();      // → [2,4,6,8,10] transform each
numbers.where((n) => n % 2 == 0).toList(); // → [2,4]      filter
numbers.reduce((a, b) => a + b);          // → 15          collapse to one
```

Pass your own function — note **no parentheses** (you pass it, not call it):

```dart
void sayHi() => print('Hi!');
repeat(3, sayHi);     // passes the function itself
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `repeat(3, sayHi())` | the `()` CALLS it first — pass `sayHi` without parens |
| forgetting `.toList()` after `.map()` | you get a lazy Iterable, not a List |
| missing `required` on named params | param is silently nullable/optional |
| `=>` with multiple statements | arrow takes ONE expression — use `{}` body |

---

## Flutter Connection

This lesson IS Flutter preparation:

```dart
ElevatedButton(
  onPressed: () => print('clicked!'),   // anonymous function as argument!
  child: Text('Tap me'),
)

// rendering a list — map straight into widgets:
children: items.map((item) => Text(item)).toList()
```

Every callback, every builder, every event handler in Flutter is a function passed as an argument.

---

## Summary

- `returnType name(params) {}` · arrow `=>` for one-liners
- Named params `{required ...}` — Flutter's calling style
- Functions are values: store them, pass them, return them
- `map` transform · `where` filter · `reduce` collapse

---

## How to Run

```bash
dart run lessons/lesson-06-functions/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 05 — Loops](../lesson-05-loops/) · [Lesson 07 — Collections](../lesson-07-collections/) ➡
