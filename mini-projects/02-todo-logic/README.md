# Mini Project 02 — Todo Logic App

## Goal
Build the complete logic of a Todo app — create, read, update, and delete tasks.

## Concepts Used
- Classes and objects (`Todo` model)
- `List` for storing todos
- CRUD operations as methods
- `where` to filter, `forEach` to display
- Null safety

## Folder Structure
```
02-todo-logic/
├── README.md
├── todo_app.dart        ← build this yourself
└── solution.dart        ← check after you try
```

## Expected Output
```
=== Todo App ===

Added: Buy groceries
Added: Learn Dart
Added: Exercise

All Todos (3):
[ ] 1. Buy groceries
[ ] 2. Learn Dart
[ ] 3. Exercise

Completed: Learn Dart

All Todos (3):
[ ] 1. Buy groceries
[x] 2. Learn Dart
[ ] 3. Exercise

Deleted: Buy groceries

Remaining (2):
[x] 1. Learn Dart
[ ] 2. Exercise
```

## Requirements
- Create a `Todo` class with `id`, `title`, `isCompleted`
- Create a `TodoService` class with:
  - `addTodo(String title)`
  - `completeTodo(int id)`
  - `deleteTodo(int id)`
  - `printAll()`
  - `printPending()`
- Run a demo in `main()` showing all operations

## Flutter Connection
This exact logic becomes a Flutter app by adding a `StatefulWidget` with a `ListView` that renders each `Todo`. The `TodoService` class stays identical.
