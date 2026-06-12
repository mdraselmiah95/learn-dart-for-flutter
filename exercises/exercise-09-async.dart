// Exercise 09 — Async
// Difficulty: Intermediate · Related lesson: lesson-11
//
// Run: dart run exercises/exercise-09-async.dart

Future<void> main() async {
  // TASK A: Fake download
  // Write Future<String> download(String file, int seconds)
  // that waits, then returns '[file] done'.
  // Download 'video.mp4' (2s) and print the result.

  // TASK B: Sequential vs parallel
  // Download 'a.zip' (1s) and 'b.zip' (1s):
  // 1) sequentially with two awaits
  // 2) in parallel with Future.wait
  // Use DateTime.now() to print how long each approach took.
  // Parallel should be ~1s, sequential ~2s.

  // TASK C: Retry logic
  // Write Future<String> flaky() that throws 'Network error'.
  // Write fetchWithRetry() that tries flaky() up to 3 times
  // with try/catch, printing each attempt, then gives up gracefully.

  // TASK D: Sensor stream
  // Write Stream<int> sensor() async* that yields 5 random-ish
  // values (e.g. i * 7 % 30) every 500ms.
  // Consume with await for; print 'ALERT' for any value over 20.
}
