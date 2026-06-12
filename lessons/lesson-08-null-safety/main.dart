// ============================================================
//  Lesson 08 — Null Safety
//  Topics: ?, ??, ??=, ?., !, late, null-safe collections
//  Dart's most important feature — prevents null crashes
// ============================================================

void main() {

  // ── 1. THE PROBLEM NULL SAFETY SOLVES ─────────────────────
  // In many languages this crashes at RUNTIME:
  //   String name = null;  name.length;  → CRASH
  // Dart catches it at COMPILE TIME instead — before the app runs

  // String name = null;    // ← Dart refuses to compile this!

  // ── 2. NULLABLE TYPES WITH ? ──────────────────────────────
  // Add ? after the type to say "null is allowed here"
  String? nickname = fetchNickname();  // might be null
  int? lastScore;                       // declared, not assigned = null
  print(nickname);                      // → null
  print(lastScore);                     // → null

  // ── 3. CLASSIC NULL CHECK ─────────────────────────────────
  // After 'if (x != null)' Dart PROMOTES x to non-nullable inside the block
  String? city = fetchCity();

  if (city != null) {
    // inside here, Dart treats city as plain String
    print('City has ${city.length} letters'); // safe — no ? needed
  } else {
    print('No city set');
  }

  // ── 4. ?. — NULL-AWARE ACCESS ─────────────────────────────
  // "call this only if not null, otherwise give null"
  String? userBio = fetchNickname();

  print(userBio?.length);         // → null (userBio is null, no crash)
  print(userBio?.toUpperCase());  // → null (method not called at all)

  // Chains stop at the first null:
  // user?.address?.street — null if user OR address is null

  // ── 5. ?? — DEFAULT VALUE ─────────────────────────────────
  // "use the left side, but if it's null use the right side"
  String displayName = userBio ?? 'Guest';
  print(displayName);             // → Guest

  // Combine ?. and ?? — the most common Dart pattern:
  int bioLength = userBio?.length ?? 0;
  print(bioLength);               // → 0

  // ── 6. ??= — ASSIGN IF NULL ───────────────────────────────
  String? theme = fetchNickname();    // null
  theme ??= 'light';              // null → assign 'light'
  print(theme);                   // → light

  // ── 7. ! — FORCE UNWRAP (DANGEROUS) ───────────────────────
  // "Trust me Dart, this is NOT null" — crashes if you're wrong!
  String? definitelySet = 'I exist';
  String sure = definitelySet!;   // OK here — we know it has a value
  print(sure);                    // → I exist

  // RULE: avoid ! unless you are 100% certain.
  // Prefer ?? or if-checks — they can never crash.

  // ── 8. late — PROMISE TO ASSIGN LATER ─────────────────────
  // Non-nullable, but assigned after declaration
  late String config;
  // print(config);               // ← would CRASH: used before assignment
  config = loadConfig();          // assign before first use
  print(config);                  // → production

  // ── 9. NULL SAFETY WITH COLLECTIONS ───────────────────────
  // List<String?> — list CAN contain null items
  List<String?> answers = ['yes', null, 'no'];
  print(answers);                 // → [yes, null, no]

  // List<String>? — the LIST ITSELF might be null
  List<String>? maybeList = fetchList();
  print(maybeList?.length ?? 0);  // → 0 (list is null)

  // whereType filters out the nulls:
  List<String> clean = answers.whereType<String>().toList();
  print(clean);                   // → [yes, no]
}

// ── HELPERS — return null to simulate missing data ──────────
// (real apps get nulls from APIs, databases, user input)

String? fetchNickname() => null;  // user never set a nickname
String? fetchCity() => 'Dhaka';   // this one has a value
List<String>? fetchList() => null;
String loadConfig() => 'production';
