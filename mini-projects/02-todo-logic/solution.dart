// ============================================================
//  Mini Project 02 — Todo Logic App (SOLUTION)
// ============================================================

void main() {
  print('=== Todo App ===\n');

  final service = TodoService();

  service.addTodo('Buy groceries');
  service.addTodo('Learn Dart');
  service.addTodo('Exercise');

  service.printAll();

  service.completeTodo(2);
  service.printAll();

  service.deleteTodo(1);
  service.printAll(title: 'Remaining');
}

// ── MODEL ────────────────────────────────────────────────────
class Todo {
  final int id;
  final String title;
  bool isCompleted;            // not final — we toggle it

  Todo({required this.id, required this.title, this.isCompleted = false});
}

// ── SERVICE — all the app logic ──────────────────────────────
class TodoService {
  final List<Todo> _todos = [];   // private — only methods touch it
  int _nextId = 1;                // auto-increment id

  void addTodo(String title) {
    _todos.add(Todo(id: _nextId, title: title));
    _nextId++;
    print('Added: $title');
  }

  void completeTodo(int id) {
    for (Todo todo in _todos) {
      if (todo.id == id) {
        todo.isCompleted = true;
        print('\nCompleted: ${todo.title}');
        return;
      }
    }
    print('\nTodo $id not found.');
  }

  void deleteTodo(int id) {
    // find it first so we can print the title
    Todo? target;
    for (Todo todo in _todos) {
      if (todo.id == id) target = todo;
    }
    if (target == null) {
      print('\nTodo $id not found.');
      return;
    }
    _todos.remove(target);
    print('\nDeleted: ${target.title}');
  }

  void printAll({String title = 'All Todos'}) {
    print('\n$title (${_todos.length}):');
    for (int i = 0; i < _todos.length; i++) {
      Todo todo = _todos[i];
      String box = todo.isCompleted ? '[x]' : '[ ]';  // checked or not
      print('$box ${i + 1}. ${todo.title}');
    }
  }

  void printPending() {
    final pending = _todos.where((t) => !t.isCompleted).toList();
    print('\nPending (${pending.length}):');
    for (Todo todo in pending) {
      print('[ ] ${todo.title}');
    }
  }
}
