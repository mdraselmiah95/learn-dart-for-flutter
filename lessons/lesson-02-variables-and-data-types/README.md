# Lesson 02 — Variables & Data Types

## Learning Objectives

By the end of this lesson you will:
- Understand all variable declaration keywords in Dart
- Know every built-in data type
- Know when to use `var`, `final`, `const`, `dynamic`, and `late`
- Understand nullable types and the `?` operator
- Know the difference between `final` and `const`

---

## Variable Keywords

| Keyword | Type Fixed? | Value Fixed? | Null Allowed? |
|---------|-------------|--------------|---------------|
| `var` | Yes (after first assign) | No | No (by default) |
| `String`, `int`... | Yes | No | No (by default) |
| `dynamic` | No | No | Yes |
| `final` | Yes | Yes (set once) | No (by default) |
| `const` | Yes | Yes (compile-time) | No |
| `String?` | Yes | No | Yes |
| `late` | Yes | Deferred | No |

---

## All Data Types

```dart
String name    = 'Rasel';        // text
int age        = 25;             // whole number
double price   = 9.99;           // decimal number
num count      = 10;             // int or double
bool isActive  = true;           // true or false
dynamic data   = 'anything';     // any type, changes freely
```

---

## var vs Explicit Type

```dart
var name = 'Rasel';       // Dart infers String — you cannot assign int later
String city = 'Dhaka';   // explicit — same result, clearer in lessons
```

Both work. In lessons, we use explicit types for clarity.

---

## final vs const

Both cannot be reassigned. The difference:

```dart
final DateTime now = DateTime.now(); // OK — value known at runtime
const double pi = 3.14159;           // must be known at compile time

// const DateTime now = DateTime.now(); // ERROR — not known at compile time
```

**Rule:** Prefer `const` when the value is a literal. Use `final` when the value comes from a function or calculation.

---

## Nullable Types

By default, Dart variables cannot hold `null`. Add `?` to allow it:

```dart
String name  = 'Rasel'; // cannot be null — compile error if you try
String? nick = null;    // OK — nullable
```

This is Dart's **null safety** system — it prevents null crashes at compile time.

---

## late

Declare a variable but assign it later — useful when you need the variable in scope but cannot assign immediately:

```dart
late String token;
// ... some logic ...
token = fetchToken(); // must assign before first read
print(token);
```

---

## Collections (Preview)

Covered fully in Lesson 07:

```dart
List<String> fruits = ['Apple', 'Banana'];  // ordered list
Map<String, int> marks = {'Math': 90};      // key-value pairs
Set<int> unique = {1, 2, 3};               // unique values only
```

---

## Flutter Connection

Every Flutter widget uses variables:

```dart
// In Flutter, this is how you store state
String userName = '';
int counter = 0;
bool isLoading = false;
List<String> items = [];
```

Understanding `final` and `const` is especially important — Flutter uses them constantly for performance optimization.

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `var x = 5; x = 'hello';` | Cannot change type after `var` assignment |
| `const x = DateTime.now();` | `const` must be compile-time value |
| `String name; print(name);` | Using variable before assigning — use `late` or assign immediately |
| `int age = null;` | Cannot assign null without `?` |

---

## How to Run

```bash
dart run lessons/lesson-02-variables-and-data-types/main.dart
```

---

## Practice

Open `practice.dart` and complete the tasks. Try each task yourself before checking `solution.dart`.

---

⬅ [Lesson 01 — Introduction](../lesson-01-introduction/) · [Lesson 03 — Operators](../lesson-03-operators/) ➡
