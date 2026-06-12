// ============================================================
//  Lesson 11 — Error Handling & Async Programming
//  Topics: try/catch/finally, throw, custom exceptions,
//          Future, async/await, Streams
// ============================================================

// main can be async too — needed to use await inside it
Future<void> main() async {

  // ── 1. WHY ERROR HANDLING ─────────────────────────────────
  // Some operations fail: bad input, no internet, missing files.
  // Without try/catch the whole program crashes.

  // ── 2. TRY / CATCH ────────────────────────────────────────
  try {
    int number = int.parse('abc');   // 'abc' is not a number → throws!
    print(number);                   // never reached
  } catch (e) {
    print('Something failed: $e');   // program continues running
  }
  // → Something failed: FormatException...

  // ── 3. ON — CATCH SPECIFIC ERROR TYPES ────────────────────
  try {
    int.parse('xyz');
  } on FormatException {             // only catches FormatException
    print('That was not a number!');
  } catch (e) {                      // catches everything else
    print('Unknown error: $e');
  }
  // → That was not a number!

  // ── 4. FINALLY — ALWAYS RUNS ──────────────────────────────
  try {
    print('Opening connection...');
    int.parse('bad');
  } catch (e) {
    print('Error caught.');
  } finally {
    // runs whether there was an error or not —
    // perfect for cleanup (closing files, connections)
    print('Connection closed.');
  }

  // ── 5. THROW — RAISE YOUR OWN ERRORS ──────────────────────
  try {
    withdraw(100, 500);              // try to withdraw more than balance
  } catch (e) {
    print('Caught: $e');             // → Caught: Insufficient funds!
  }

  // ── 6. WHY ASYNC EXISTS ───────────────────────────────────
  // Dart runs on ONE thread. A slow task (network, file) would
  // FREEZE everything — in Flutter the whole UI would stop.
  // async lets slow work happen without blocking.

  // ── 7. FUTURE + AWAIT ─────────────────────────────────────
  // Future<String> = "a String that will arrive later"
  // await = pause THIS function until the value arrives
  //         (the rest of the program keeps running!)
  print('Ordering pizza...');
  String pizza = await orderPizza(); // waits ~1 second
  print(pizza);                      // → Pizza is ready!

  // ── 8. ASYNC ERROR HANDLING ───────────────────────────────
  // try/catch works the same with await
  try {
    String data = await fetchFromServer(shouldFail: true);
    print(data);
  } catch (e) {
    print('Network error: $e');      // → Network error: Server down!
  }

  // ── 9. PARALLEL FUTURES ───────────────────────────────────
  // Future.wait runs several futures AT THE SAME TIME
  print('Loading profile and settings together...');
  List<String> results = await Future.wait([
    loadProfile(),                   // both start immediately
    loadSettings(),                  // total time = slowest one, not sum!
  ]);
  print(results);                    // → [Profile loaded, Settings loaded]

  // ── 10. STREAMS — MANY VALUES OVER TIME ───────────────────
  // Future = ONE value later. Stream = MANY values over time.
  // Like: Future = a letter arriving, Stream = a YouTube live feed
  print('Counting down:');
  await for (int n in countdown(3)) {   // await for = loop over a stream
    print(n);
  }
  print('Liftoff!');
  // → 3, 2, 1, Liftoff!
}

// ── HELPER FUNCTIONS ─────────────────────────────────────────

// throw raises an error that travels up to the nearest catch
void withdraw(double balance, double amount) {
  if (amount > balance) {
    throw Exception('Insufficient funds!');
  }
  print('Withdrew \$$amount');
}

// async function — returns a Future automatically
Future<String> orderPizza() async {
  // Future.delayed simulates a slow task (like a network call)
  await Future.delayed(Duration(seconds: 1));
  return 'Pizza is ready!';
}

Future<String> fetchFromServer({required bool shouldFail}) async {
  await Future.delayed(Duration(milliseconds: 500));
  if (shouldFail) {
    throw Exception('Server down!');
  }
  return 'Data from server';
}

Future<String> loadProfile() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Profile loaded';
}

Future<String> loadSettings() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Settings loaded';
}

// async* + yield = a Stream that emits values one by one
Stream<int> countdown(int from) async* {
  for (int i = from; i >= 1; i--) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;                       // emit the next value
  }
}
