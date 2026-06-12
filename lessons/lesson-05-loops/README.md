# Lesson 05 — Loops

## Learning Objectives

By the end of this lesson you will:
- Repeat code a fixed number of times with `for`
- Walk through collections with `for-in` and `forEach`
- Loop on conditions with `while` and `do-while`
- Control loop flow with `break` and `continue`

---

## for — when you know how many times

```dart
for (int i = 1; i <= 5; i++) {
  print('Round $i');
}
//   ↑ start    ↑ keep going while true   ↑ after each round
```

Count down by flipping the pieces: `for (int i = 5; i >= 1; i--)`.

---

## for-in — walk through a collection

```dart
List<String> fruits = ['Apple', 'Banana', 'Mango'];

for (String fruit in fruits) {
  print(fruit);            // each item, in order
}
```

Need the position too? Classic `for` with index:

```dart
for (int i = 0; i < fruits.length; i++) {
  print('${i + 1}. ${fruits[i]}');   // 1. Apple ...
}
```

---

## while — when you don't know how many times

```dart
int lives = 3;
while (lives > 0) {     // checked BEFORE each round
  print('Lives: $lives');
  lives--;              // ⚠ must change something — or infinite loop!
}
```

## do-while — body runs at least once

```dart
do {
  attempts++;
} while (attempts < 3);  // checked AFTER the body
```

---

## break and continue

```dart
for (int i = 1; i <= 10; i++) {
  if (i % 2 != 0) continue;  // skip this round → next i
  if (i > 8) break;          // exit the loop entirely
  print(i);                  // → 2 4 6 8
}
```

---

## forEach — method-style looping

```dart
fruits.forEach(print);                 // shortest possible form

marks.forEach((subject, mark) {        // Maps give key + value
  print('$subject: $mark');
});
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `i <= list.length` | off-by-one crash — last index is `length - 1`, use `<` |
| forgetting `i++` / `lives--` | infinite loop — program hangs |
| modifying a list while for-in looping it | runtime error — loop a copy instead |
| `break` when you meant `continue` | exits whole loop instead of skipping one round |

---

## Flutter Connection

Loops become widget lists in Flutter:

```dart
Column(
  children: [
    for (var item in items) Text(item),   // collection-for in widget tree!
  ],
)
```

`ListView.builder` is a managed loop — `itemBuilder` runs once per index. Master loops here, that pattern becomes obvious.

---

## Summary

- `for` — fixed count · `for-in` — each item · `while` — unknown count · `do-while` — at least once
- `break` exits, `continue` skips
- Loop body must move toward the end condition — or it never ends

---

## How to Run

```bash
dart run lessons/lesson-05-loops/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks (FizzBuzz challenge!) → check `solution.dart`.

---

⬅ [Lesson 04 — Control Flow](../lesson-04-control-flow/) · [Lesson 06 — Functions](../lesson-06-functions/) ➡
