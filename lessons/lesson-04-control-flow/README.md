# Lesson 04 — Control Flow

## Learning Objectives

By the end of this lesson you will:
- Make decisions with `if` / `else if` / `else`
- Match exact values cleanly with `switch`
- Write one-line decisions with the ternary operator
- Know when to flatten nested conditions

---

## if / else if / else

Dart checks top to bottom and runs the **first** matching block:

```dart
int score = 75;

if (score >= 90) {
  print('A');
} else if (score >= 70) {
  print('B');        // 75 lands here — stops checking
} else {
  print('F');
}
```

**Order matters!** Put the strictest condition first — if you checked `score >= 70` before `>= 90`, an A student would get a B.

---

## Combining Conditions

```dart
if (age >= 18 && hasLicense) {
  print('Can drive');
} else if (age >= 18 && !hasLicense) {
  print('Get a license first');
} else {
  print('Too young');
}
```

---

## switch — clean exact matching

```dart
switch (status) {
  case 'loading':
    print('Show spinner');
    break;              // ⚠ required — exits the switch
  case 'success':
    print('Show data');
    break;
  default:              // nothing matched
    print('Unknown');
}
```

**Stacked cases** share one body:

```dart
case 'Saturday':
case 'Sunday':          // both fall into the next body
  print('Weekend!');
  break;
```

---

## Ternary — one-line if/else

```dart
String result = score >= 50 ? 'Pass' : 'Fail';
//              condition   ? ifTrue : ifFalse
```

Brilliant inside strings:

```dart
print('$count ${count == 1 ? 'item' : 'items'}');
```

**Rule:** ternary for simple either/or. Three or more branches → use if/else.

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `if (x = 5)` | assignment, not comparison — use `==` |
| missing `break` in switch | compile error in Dart (unlike C/Java) |
| wrong order of else-if | broader condition first swallows specific cases |
| nested ternaries | unreadable — use if/else instead |
| `if (isReady == true)` | redundant — just `if (isReady)` |

---

## Flutter Connection

Control flow IS Flutter UI logic:

```dart
// the most common Flutter pattern you will ever write:
isLoading
  ? CircularProgressIndicator()   // ternary chooses the widget!
  : ListView(children: items)
```

`switch` powers navigation routing and state rendering in every real app.

---

## Summary

- `if/else if/else` — strictest condition first
- `switch` — exact value matching, `break` required, stack cases to share a body
- ternary `? :` — one-line decisions, perfect for choosing between two widgets
- Flat conditions with `&&` beat deep nesting

---

## How to Run

```bash
dart run lessons/lesson-04-control-flow/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 03 — Operators](../lesson-03-operators/) · [Lesson 05 — Loops](../lesson-05-loops/) ➡
