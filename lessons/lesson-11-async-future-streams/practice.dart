// ============================================================
//  Lesson 11 — Practice Tasks
//  Try each task yourself before checking solution.dart
// ============================================================

Future<void> main() async {

  // ── TASK 1 ────────────────────────────────────────────────
  // Use try/catch to safely parse the String '12a' into an int.
  // Print 'Invalid number' when it fails.


  // ── TASK 2 ────────────────────────────────────────────────
  // Write a function checkAge(int age) that throws an
  // Exception('Too young') if age < 18, otherwise prints 'Welcome!'.
  // Call it with 20 and then 15 — catch the error for 15.


  // ── TASK 3 ────────────────────────────────────────────────
  // Write an async function downloadFile() that:
  // - waits 1 second (Future.delayed)
  // - returns 'file.pdf downloaded'
  // Await it in main and print the result.


  // ── TASK 4 ────────────────────────────────────────────────
  // Write async function fetchUser({required bool fail}) that
  // throws Exception('User not found') when fail is true,
  // otherwise returns 'User: Rasel'.
  // Call it twice (fail: false, fail: true) with try/catch.


  // ── TASK 5 (Challenge) ────────────────────────────────────
  // Write a Stream<int> evenNumbers(int max) using async* that
  // yields even numbers from 2 up to max, 300ms apart.
  // Consume it with 'await for' and print each value.
  // Test with max = 8. Expected: 2 4 6 8

}
