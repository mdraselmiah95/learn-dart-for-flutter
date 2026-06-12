# Lesson 07 — Collections

## Learning Objectives

By the end of this lesson you will:
- Choose correctly between `List`, `Set`, and `Map`
- Add, remove, search, and sort collection data
- Use the spread operator and collection-if/for
- Chain power methods: `map`, `where`, `reduce`, `any`, `every`

---

## The Three Collections

| Type | Ordered? | Duplicates? | Access by | Use for |
|------|----------|-------------|-----------|---------|
| `List` | ✅ | ✅ | index `[0]` | items in order: messages, products |
| `Set` | ❌ | ❌ | contains | uniqueness: tags, selected IDs |
| `Map` | ❌ | keys unique | key `['name']` | lookups: settings, JSON data |

---

## List Essentials

```dart
List<String> fruits = ['Apple', 'Banana'];

fruits.add('Mango');          // add to end
fruits.insert(0, 'Lychee');   // add at position
fruits.remove('Banana');      // remove by value
fruits.removeAt(0);           // remove by index
fruits[0];                    // read by index (starts at 0!)
fruits.first; fruits.last; fruits.length;
fruits.contains('Mango');     // → true
```

---

## Set Essentials

```dart
Set<int> ids = {101, 102};
ids.add(101);                 // duplicate — silently ignored

// the classic trick — dedupe a List:
List<int> unique = [1, 2, 2, 3].toSet().toList();  // → [1, 2, 3]
```

---

## Map Essentials

```dart
Map<String, int> marks = {'Math': 90};

marks['English'] = 85;        // add
marks['Math'] = 95;           // update
marks['History'];             // → null if missing (no crash)
marks.keys; marks.values;
marks.containsKey('Math');    // → true
```

---

## Spread & Collection-if/for

```dart
var combined = [...listA, ...listB];          // merge lists

var menu = [
  'Burger',
  if (isLoggedIn) 'Member Deal',              // conditional item!
  for (var s in sides) 'Side: $s',            // generated items!
];
```

These two patterns are **everywhere** in Flutter widget lists.

---

## Power Methods

```dart
numbers.map((n) => n * 2)         // transform each
numbers.where((n) => n > 4)       // keep matching
numbers.reduce((a, b) => a + b)   // collapse to one value
numbers.any((n) => n > 8)         // true if AT LEAST ONE matches
numbers.every((n) => n > 0)       // true only if ALL match
numbers.firstWhere((n) => n > 4)  // first match
numbers.sort()                    // in place!
numbers.reversed.toList()
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `list[list.length]` | out of range — last item is `length - 1` |
| forgetting `.toList()` after map/where | lazy Iterable, not a List |
| `map['key']` assumed non-null | missing key returns null — handle it |
| `.sort()` expecting a return value | sorts IN PLACE, returns void |
| using List when you need uniqueness | use a Set — free dedupe + fast contains |

---

## Flutter Connection

```dart
// THE most common Flutter pattern — List → widgets:
ListView(
  children: products.map((p) => ProductCard(p)).toList(),
)

// JSON from any API is Map<String, dynamic>:
final name = json['name'];
```

Settings, themes, routes, JSON — all Maps. Selected items — Sets. Everything else — Lists.

---

## Summary

- List = order, Set = uniqueness, Map = lookup
- Spread `...` and collection-if/for build dynamic lists elegantly
- Chain `where` + `map` + `toList` — the everyday combo

---

## How to Run

```bash
dart run lessons/lesson-07-collections/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 06 — Functions](../lesson-06-functions/) · [Lesson 08 — Null Safety](../lesson-08-null-safety/) ➡
