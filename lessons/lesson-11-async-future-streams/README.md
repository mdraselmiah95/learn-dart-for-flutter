# Lesson 11 — Async Programming: Future, async/await, Streams

## Topics Covered
- Why async programming exists (single-threaded Dart)
- `Future<T>` — a value that arrives later
- `async` and `await` keywords
- Error handling with `try/catch` in async code
- `Future.delayed`, `Future.value`, `Future.error`
- Chaining with `.then()` and `.catchError()`
- `Stream<T>` — continuous sequence of async values
- `StreamController` basics

## Flutter Connection
Every Flutter API call, database read, and file operation is async. `FutureBuilder` and `StreamBuilder` are core Flutter widgets that render UI based on async data. You cannot build real Flutter apps without this lesson.

## How to Run
```bash
dart run lessons/lesson-11-async-future-streams/main.dart
```

> Files coming soon. See [roadmap](../../roadmap.md) for lesson schedule.
