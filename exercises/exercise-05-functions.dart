// Exercise 05 — Functions
// Difficulty: Intermediate · Related lesson: lesson-06
//
// Run: dart run exercises/exercise-05-functions.dart

void main() {
  // TASK A: Grade calculator
  // Write String grade(int marks) → 'A+' 'A' 'B' 'C' 'F'
  // Test with: 95, 85, 72, 40

  // TASK B: Flexible greeting
  // greet({required String name, String language = 'en'})
  // 'en' → Hello [name]!  'bn' → Assalamu alaikum [name]!
  // Call both ways.

  // TASK C: Apply twice
  // Write int applyTwice(int x, int Function(int) fn)
  // that runs fn on x two times.
  // applyTwice(3, (n) => n * n) → 81

  // TASK D: Counter factory
  // Write a function makeCounter() that returns a function.
  // Each call of the returned function prints the next number.
  // var next = makeCounter(); next(); next(); next(); → 1 2 3
  // (Hint: closure — the returned function remembers its variable)
}
