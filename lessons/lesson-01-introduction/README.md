# Lesson 01 — Introduction to Dart

## Learning Objectives

By the end of this lesson you will:
- Know what Dart is and why it was created
- Have Dart installed and running
- Write and run your first Dart program
- Understand the basic structure of every Dart file
- Use all three types of comments
- Use `print()` with string interpolation

---

## What is Dart?

Dart is a programming language created by Google in 2011. It is:

- **Strongly typed** — every variable has a type
- **Compiled** — fast on both mobile and web
- **Object-oriented** — everything is an object
- **Null-safe** — prevents null crashes at compile time
- **The language Flutter is built on**

If you know JavaScript, Dart will feel familiar — but more structured and safer.

---

## Basic Dart File Structure

Every Dart program has this structure:

```dart
// 1. Optional imports (used in later lessons)
import 'dart:math';

// 2. Functions and classes (defined outside main)
void greet(String name) {
  print('Hello, $name!');
}

// 3. The main() function — program starts here
void main() {
  greet('Rasel');
}
```

**Key rule:** Execution always starts at `main()`. Every Dart file that runs must have one.

---

## Comments

```dart
// Single-line comment — use for short notes

/*
  Multi-line comment
  Use for longer explanations
  or to temporarily disable code
*/

/// Documentation comment
/// Use above functions and classes
/// IDE shows this as a tooltip
void myFunction() {}
```

---

## Print & String Interpolation

```dart
void main() {
  print('Hello, World!');         // basic print

  String name = 'Rasel';
  print('My name is $name');      // insert variable with $
  print('1 + 1 = ${1 + 1}');     // run expression with ${}
}
```

Output:
```
Hello, World!
My name is Rasel
1 + 1 = 2
```

---

## Flutter Connection

In Flutter, `print()` is used for debugging. Every Flutter widget file starts with `import` statements and class definitions — the same structure you learn here. Understanding `main()` matters because Flutter apps also start from `main()`:

```dart
void main() {
  runApp(MyApp()); // Flutter starts here — same as Dart's main()
}
```

---

## Common Mistakes

| Mistake | Wrong | Correct |
|---------|-------|---------|
| Missing semicolon | `print('hi')` | `print('hi');` |
| Wrong quotes inside string | `print('it's')` | `print("it's")` |
| Expression without `${}` | `print('sum: 1+1')` | `print('sum: ${1+1}')` |
| Calling before defining | call before `main()` | define functions above or below — both work |

---

## How to Run

```bash
dart run lessons/lesson-01-introduction/main.dart
```

Or paste the code into [DartPad](https://dartpad.dev).

---

## Practice

Open `practice.dart` and complete the tasks. Try each task yourself before checking `solution.dart`.
