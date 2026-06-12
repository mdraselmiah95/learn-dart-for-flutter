// ============================================================
//  Lesson 11 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

Future<void> main() async {

  // ── TASK 1 ────────────────────────────────────────────────
  try {
    int value = int.parse('12a');   // throws FormatException
    print(value);
  } catch (e) {
    print('Invalid number');        // → Invalid number
  }

  // ── TASK 2 ────────────────────────────────────────────────
  checkAge(20);                     // → Welcome!
  try {
    checkAge(15);                   // throws
  } catch (e) {
    print('Blocked: $e');           // → Blocked: Exception: Too young
  }

  // ── TASK 3 ────────────────────────────────────────────────
  String result = await downloadFile();
  print(result);                    // → file.pdf downloaded

  // ── TASK 4 ────────────────────────────────────────────────
  try {
    print(await fetchUser(fail: false)); // → User: Rasel
    print(await fetchUser(fail: true));  // throws before printing
  } catch (e) {
    print('Error: $e');             // → Error: Exception: User not found
  }

  // ── TASK 5 ────────────────────────────────────────────────
  await for (int n in evenNumbers(8)) {
    print(n);                       // → 2, 4, 6, 8
  }
}

// Task 2 — throw on invalid input
void checkAge(int age) {
  if (age < 18) {
    throw Exception('Too young');
  }
  print('Welcome!');
}

// Task 3 — async function returning a Future<String>
Future<String> downloadFile() async {
  await Future.delayed(Duration(seconds: 1)); // simulate slow download
  return 'file.pdf downloaded';
}

// Task 4 — async function that can fail
Future<String> fetchUser({required bool fail}) async {
  await Future.delayed(Duration(milliseconds: 300));
  if (fail) {
    throw Exception('User not found');
  }
  return 'User: Rasel';
}

// Task 5 — stream of even numbers
Stream<int> evenNumbers(int max) async* {
  for (int i = 2; i <= max; i += 2) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;                        // emit each even number
  }
}
