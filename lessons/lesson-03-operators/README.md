# Lesson 03 — Operators

## Learning Objectives

By the end of this lesson you will:
- Use all arithmetic operators including Dart's special `~/`
- Use shorthand assignment operators (`+=`, `++`)
- Compare values and combine conditions with logical operators
- Handle null values with `??`, `??=`, and `?.`
- Check types at runtime with `is` and `as`

---

## Arithmetic Operators

```dart
print(10 + 3);   // → 13
print(10 - 3);   // → 7
print(10 * 3);   // → 30
print(10 / 3);   // → 3.333...  ⚠ ALWAYS returns double
print(10 ~/ 3);  // → 3         integer division — Dart special!
print(10 % 3);   // → 1         remainder (modulo)
```

**Key Dart quirk:** `/` always gives a `double`, even `10 / 2` → `5.0`. Want an int result? Use `~/`.

---

## Assignment Shorthands

```dart
int x = 5;
x += 3;   // x = x + 3  → 8
x -= 2;   // x = x - 2  → 6
x *= 2;   // x = x * 2  → 12
x++;      // x = x + 1  → 13
x--;      // x = x - 1  → 12
```

---

## Comparison Operators

Always return `bool`:

```dart
5 == 5   // true   — equal (TWO equals signs!)
5 != 4   // true   — not equal
5 > 3    // true
5 >= 5   // true
```

---

## Logical Operators

```dart
a && b   // AND — both must be true
a || b   // OR  — at least one true
!a       // NOT — flips the bool
```

```dart
bool canDrive = age >= 18 && hasLicense;  // real-world combo
```

---

## Null-Aware Operators (Dart's superpower)

```dart
String? name;             // null right now

print(name ?? 'Guest');   // → Guest      use fallback if null
name ??= 'Rasel';         // assign only if currently null
print(name?.length);      // safe access — null instead of crash
```

These three appear in **every** Flutter codebase. Full deep-dive in Lesson 08.

---

## Type Test Operators

```dart
value is String    // true if value is a String
value is! int      // true if value is NOT an int
value as String    // cast — treat value as String (crashes if wrong!)
```

---

## Common Mistakes

| Mistake | Problem | Fix |
|---------|---------|-----|
| `if (x = 5)` | `=` assigns, doesn't compare | use `==` |
| `int half = 10 / 2;` | `/` returns double | use `10 ~/ 2` or type `double` |
| `5 == '5'` | comparing int with String → always false | parse first |
| overusing `as` | crashes at runtime if type wrong | prefer `is` check first |

---

## Flutter Connection

Operators drive every Flutter app: `itemCount: items.length ~/ 2` for grid math, `user?.name ?? 'Guest'` for safe display, `isLoading && !hasError` for which widget to show.

---

## Summary

- Arithmetic: `+ - * / ~/ %` — remember `/` → double, `~/` → int
- Compare with `==` (never single `=`)
- Combine conditions: `&&` `||` `!`
- Null safety trio: `??` `??=` `?.`
- Type checks: `is`, `is!`, `as`

---

## How to Run

```bash
dart run lessons/lesson-03-operators/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 02 — Variables](../lesson-02-variables-and-data-types/) · [Lesson 04 — Control Flow](../lesson-04-control-flow/) ➡
