// ============================================================
//  Lesson 05 — Loops
//  Topics: for, for-in, while, do-while, break, continue, forEach
// ============================================================

void main() {

  // ── 1. FOR LOOP ───────────────────────────────────────────
  // for (start; keep-going condition; step after each round)
  for (int i = 1; i <= 5; i++) {
    print('Round $i');
  }
  // → Round 1 ... Round 5

  // Counting down works too
  for (int i = 3; i >= 1; i--) {
    print('Countdown: $i');
  }
  print('Go!');
  // → 3, 2, 1, Go!

  // ── 2. FOR-IN LOOP ────────────────────────────────────────
  // Loop through every item of a collection — no index needed
  List<String> fruits = ['Apple', 'Banana', 'Mango'];

  for (String fruit in fruits) {
    print('I like $fruit');
  }
  // → I like Apple / Banana / Mango

  // Need the index too? Use a classic for loop:
  for (int i = 0; i < fruits.length; i++) {
    print('${i + 1}. ${fruits[i]}');
  }
  // → 1. Apple / 2. Banana / 3. Mango

  // ── 3. WHILE LOOP ─────────────────────────────────────────
  // Use when you don't know how many rounds in advance
  int lives = 3;

  while (lives > 0) {        // checked BEFORE each round
    print('Lives left: $lives');
    lives--;                 // must change something or loop never ends!
  }
  print('Game over.');
  // → 3, 2, 1, Game over.

  // ── 4. DO-WHILE LOOP ──────────────────────────────────────
  // Body runs FIRST, condition checked AFTER → always runs at least once
  int attempts = 0;

  do {
    attempts++;
    print('Attempt $attempts');
  } while (attempts < 3);    // checked after the body
  // → Attempt 1, 2, 3

  // ── 5. BREAK ──────────────────────────────────────────────
  // break = exit the loop completely
  List<int> numbers = [4, 8, 15, 16, 23, 42];

  for (int n in numbers) {
    if (n > 15) {
      print('Found first number above 15: $n');
      break;                 // stop searching — we found it
    }
  }
  // → Found first number above 15: 16

  // ── 6. CONTINUE ───────────────────────────────────────────
  // continue = skip this round, jump to the next one
  for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) continue; // skip odd numbers
    print('Even: $i');
  }
  // → Even: 2, 4, 6, 8, 10

  // ── 7. FOREACH ────────────────────────────────────────────
  // Method version of for-in — takes a function to run per item
  fruits.forEach(print);     // shortest form — pass print directly
  // → Apple / Banana / Mango

  // With Map — get key and value each round
  Map<String, int> marks = {'Math': 90, 'English': 85};
  marks.forEach((subject, mark) {
    print('$subject: $mark');
  });
  // → Math: 90 / English: 85

  // ── 8. NESTED LOOPS ───────────────────────────────────────
  // A loop inside a loop — useful for grids and tables
  for (int row = 1; row <= 3; row++) {
    String line = '';
    for (int col = 1; col <= 3; col++) {
      line += '(${row},${col}) ';
    }
    print(line);
  }
  // → (1,1) (1,2) (1,3)
  // → (2,1) (2,2) (2,3)
  // → (3,1) (3,2) (3,3)
}
