# Lesson 08 — Null Safety

## Learning Objectives

By the end of this lesson you will:
- Understand WHY null safety exists (the billion-dollar mistake)
- Declare nullable types with `?` and handle them safely
- Master the null toolkit: `??`, `??=`, `?.`, `!`, `late`
- Clean nullable data out of collections

---

## The Problem

In most languages, this compiles fine and **crashes at runtime**:

```
String name = null;
name.length;          // 💥 NullPointerException — app dead
```

Dart refuses to compile it. Null bugs get caught **before** your app ever runs. This is why modern Flutter apps crash so rarely.

---

## Nullable Types

```dart
String name = 'Rasel';   // can NEVER be null — guaranteed
String? nickname;        // ? = null allowed, currently null
```

Dart forces you to handle the null case before using a `String?` as a `String`.

---

## The Null Toolkit

### 1. Classic check — with type promotion

```dart
if (nickname != null) {
  print(nickname.length);   // inside the if, Dart PROMOTES it to String!
}
```

### 2. `?.` — safe access

```dart
print(nickname?.length);    // null if nickname is null — never crashes
```

### 3. `??` — fallback value

```dart
String display = nickname ?? 'Guest';   // use 'Guest' when null
```

### 4. `??=` — assign if null

```dart
theme ??= 'light';          // only assigns when currently null
```

### 5. `!` — force unwrap ⚠ DANGEROUS

```dart
String sure = nickname!;    // "trust me" — CRASHES if you're wrong
```

**Rule:** `!` is a promise you make to the compiler. Break it → runtime crash. Prefer `??` or if-checks, they cannot crash.

### 6. `late` — assign later

```dart
late String config;         // non-null, but assigned later
config = loadConfig();      // must assign before first read
```

---

## Nullable Collections — know the difference

```dart
List<String?> a;   // list of items that might be null: ['yes', null]
List<String>? b;   // the LIST ITSELF might be null
```

Clean nulls out:

```dart
List<String> clean = items.whereType<String>().toList();
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| sprinkling `!` everywhere | turns compile-time safety back into runtime crashes |
| `String? x` then `x.length` | won't compile — use `x?.length` or check first |
| `late` without ever assigning | crashes on first read: LateInitializationError |
| `x ?? ''` hiding real bugs | sometimes you SHOULD handle null explicitly, not mask it |

---

## Flutter Connection

You cannot write Flutter without this lesson:

```dart
// every Flutter codebase, every day:
Text(user?.name ?? 'Guest')

// nullable state in StatefulWidget:
String? errorMessage;
if (errorMessage != null) ErrorBanner(errorMessage!)
```

API data, route arguments, optional configs — nullable everywhere. The toolkit above is your daily driver.

---

## Summary

- `?` declares nullable · without it, null is impossible
- Toolkit: if-check (promotes!), `?.` safe access, `??` fallback, `??=` lazy assign
- `!` only when 100% certain — it can crash
- `late` = non-null but assigned later

---

## How to Run

```bash
dart run lessons/lesson-08-null-safety/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 07 — Collections](../lesson-07-collections/) · [Lesson 09 — OOP Classes](../lesson-09-oop-classes/) ➡
