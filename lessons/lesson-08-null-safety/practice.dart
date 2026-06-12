// ============================================================
//  Lesson 08 — Practice Tasks
//  Try each task yourself before checking solution.dart
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  // Declare a nullable double? discount with no value.
  // Print the final price of a 100 taka product:
  // if discount is null treat it as 0.
  // Use ?? — expected output: 100.0


  // ── TASK 2 ────────────────────────────────────────────────
  // Create String? email = getEmail(); (write getEmail to return null)
  // Print the email length safely using ?. and ??
  // Expected output: 0


  // ── TASK 3 ────────────────────────────────────────────────
  // Create String? userInput = getInput(); (returns null)
  // Use ??= to give it the value 'default'.
  // Print it. Expected: default


  // ── TASK 4 ────────────────────────────────────────────────
  // Write a function greetUser(String? name) that prints:
  // 'Hello, [name]!' if name is not null
  // 'Hello, stranger!' if name is null
  // Use an if-check (null promotion).
  // Test with 'Rasel' and null.


  // ── TASK 5 (Challenge) ────────────────────────────────────
  // Given: List<int?> rawScores = [80, null, 95, null, 60];
  // 1) Build a clean List<int> without nulls (use whereType)
  // 2) Print the sum of the clean scores. Expected: 235
  // 3) Print how many nulls were removed. Expected: 2

}
