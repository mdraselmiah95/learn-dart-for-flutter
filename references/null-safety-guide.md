# Null Safety — Complete Quick Reference

## The Rule

Without `?`, null is **impossible**. With `?`, you must handle the null case before use.

```dart
String a = 'hi';   // can NEVER be null
String? b;         // may be null — Dart forces you to deal with it
```

## Decision Table — which tool when?

| Situation | Tool | Example |
|-----------|------|---------|
| Need a fallback value | `??` | `name ?? 'Guest'` |
| Assign only when null | `??=` | `theme ??= 'light'` |
| Call method if not null | `?.` | `user?.logout()` |
| Multiple uses in a block | if-check (promotes) | `if (x != null) { x.length; }` |
| 100% certain not null | `!` (last resort) | `cached!` |
| Will assign before use | `late` | `late final controller;` |
| List has null items | `whereType<T>()` | `items.whereType<String>()` |

## Promotion — the underrated feature

```dart
String? name = fetch();

if (name != null) {
  // Dart PROMOTES name to plain String inside this block
  print(name.length);       // no ?, no ! needed
}

// early return promotes for the rest of the function:
if (name == null) return;
print(name.length);          // promoted from here down
```

⚠ Promotion only works on **local variables** — not class fields. For fields, copy to a local first:

```dart
final localName = this.name;   // copy field to local
if (localName != null) { ... } // now promotion works
```

## The `!` Danger Scale

```dart
user!.name      // 🔴 crashes whole app if user is null
user?.name      // 🟢 returns null, never crashes
user?.name ?? 'Guest'  // 🟢 always a usable String
```

Every `!` is a bet. Lose the bet → production crash. Prefer the green patterns.

## Nullable vs List-of-Nullable

```dart
List<String>? a;       // the LIST may be null
List<String?> b;       // the ITEMS may be null
List<String?>? c;      // both (avoid this)

a?.length ?? 0         // safe list access
b.whereType<String>()  // strip null items
```

## late — the two uses

```dart
late String config;          // 1. assign-later promise
late final db = connect();   // 2. LAZY — runs only on first access!
```

`late final` + initializer = lazy initialization — the value is computed only when first used. Common Flutter trick for controllers.

## Flutter Patterns

```dart
Text(user?.name ?? 'Guest')                  // display fallback
if (error != null) ErrorBanner(error!)       // checked, then ! is safe
late final controller = TextEditingController();  // lazy field init
```
