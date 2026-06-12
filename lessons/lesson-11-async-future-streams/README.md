# Lesson 11 — Error Handling & Async Programming

## Learning Objectives

By the end of this lesson you will:
- Catch errors gracefully with `try` / `catch` / `on` / `finally`
- Raise your own errors with `throw`
- Understand why async exists and write `async`/`await` code
- Run futures in parallel and consume `Stream`s

---

## Part 1 — Error Handling

### try / catch

```dart
try {
  int n = int.parse('abc');     // throws FormatException
  print(n);                     // never reached
} catch (e) {
  print('Failed: $e');          // program continues!
}
```

### on — catch specific types

```dart
try {
  int.parse('xyz');
} on FormatException {          // this exact error type
  print('Not a number!');
} catch (e) {                   // everything else
  print('Unknown: $e');
}
```

### finally — always runs

```dart
} finally {
  connection.close();           // cleanup — error or not
}
```

### throw — raise your own

```dart
if (amount > balance) {
  throw Exception('Insufficient funds!');
}
```

---

## Part 2 — Async Programming

### Why async exists

Dart runs on **one thread**. A 2-second network call without async = the entire app frozen for 2 seconds. In Flutter that means UI completely stuck. Async lets slow work happen without blocking.

### Future — a value that arrives later

```dart
Future<String> orderPizza() async {           // async marks the function
  await Future.delayed(Duration(seconds: 1)); // await = pause HERE
  return 'Pizza ready!';                      // arrives 1 second later
}

void main() async {                  // main can be async too
  String pizza = await orderPizza(); // wait for the result
  print(pizza);
}
```

Mental model: `await` = "pause this function until the value arrives — let everything else keep running."

### Async errors — same try/catch

```dart
try {
  final data = await fetchFromServer();
} catch (e) {
  print('Network error: $e');
}
```

### Parallel futures

```dart
// runs BOTH at once — total time = slowest one, not the sum:
final results = await Future.wait([loadProfile(), loadSettings()]);
```

### Stream — many values over time

Future = one letter arriving. Stream = a live feed.

```dart
Stream<int> countdown(int from) async* {   // async* = stream function
  for (int i = from; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;                               // emit each value
  }
}

await for (int n in countdown(3)) {        // await for = stream loop
  print(n);                                // 3... 2... 1...
}
```

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| forgetting `await` | you get a `Future<String>` instead of `String` — weird bugs |
| `await` in a non-async function | won't compile — mark the function `async` |
| catching errors but ignoring them | silent failures are worse than crashes — at least log |
| `Future.wait` when calls depend on each other | parallel only works for INDEPENDENT tasks |

---

## Flutter Connection

Every real Flutter app is async at its core:

```dart
// fetching data when screen opens:
final user = await api.fetchUser();

// FutureBuilder — renders UI from a Future:
FutureBuilder(
  future: fetchUsers(),
  builder: (context, snapshot) {
    if (snapshot.hasError) return ErrorWidget();      // catch, as UI!
    if (!snapshot.hasData) return CircularProgressIndicator();
    return UserList(snapshot.data!);
  },
)
```

`StreamBuilder` does the same for Streams — chat messages, live scores, Firebase data.

---

## Summary

- `try/catch/on/finally` — handle errors without crashing · `throw` — raise your own
- One thread → async keeps the app responsive
- `async` + `await` — write async code that reads like sync code
- `Future` = one value later · `Stream` = many values over time

---

## How to Run

```bash
dart run lessons/lesson-11-async-future-streams/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 10 — Inheritance & Mixins](../lesson-10-inheritance-abstract-mixin/) · [Lesson 12 — Flutter Readiness](../lesson-12-flutter-readiness/) ➡
