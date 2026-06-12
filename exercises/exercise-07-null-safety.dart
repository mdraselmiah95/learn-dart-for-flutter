// Exercise 07 — Null Safety
// Difficulty: Intermediate · Related lesson: lesson-08
//
// Run: dart run exercises/exercise-07-null-safety.dart

void main() {
  // TASK A: Safe profile printer
  // Write printProfile(String? name, int? age) that prints:
  // 'Name: [name or Anonymous], Age: [age or unknown]'
  // using only ?? (no if statements). Test all combinations.

  // TASK B: Config merger
  // Map<String, String?> config = {'theme': null, 'lang': 'bn'};
  // Defaults: theme=light, lang=en, font=system.
  // Build the final config using ?? — every value non-null.

  // TASK C: First valid value
  // String? fromCache, fromDisk = null; String? fromNetwork = 'live-data';
  // Get the first non-null with chained ?? and print it.

  // TASK D: Null-safe average
  // List<int?> readings = [12, null, 18, null, 15];
  // Compute the average of NON-null values only. → 15.0
  // Bonus: what if ALL readings are null? Make it not crash.
}
