// Exercise 08 — OOP
// Difficulty: Intermediate · Related lessons: lesson-09, lesson-10
//
// Run: dart run exercises/exercise-08-oop.dart

void main() {
  // TASK A: Library book
  // Class Book: final String title, bool isBorrowed (starts false),
  // methods borrow() and giveBack() with guard logic
  // (can't borrow a borrowed book — print a warning).

  // TASK B: Shapes hierarchy
  // abstract class Shape with double area() and double perimeter().
  // Implement Rectangle and Circle. Put both in a List<Shape>,
  // loop and print each area + perimeter.

  // TASK C: Smart devices
  // mixin Connectable: connect() prints '[runtimeType] connected to WiFi'
  // Classes: Lamp, Speaker, Fan — only Lamp and Speaker get the mixin.
  // Show that fan.connect() does not exist.

  // TASK D: Bank account with history
  // Class Account: private _balance, private List<String> _history.
  // deposit/withdraw add entries like 'deposit: 500'.
  // Getter 'statement' returns the history. Withdraw more than balance → throw.
}
