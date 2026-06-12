// ============================================================
//  Lesson 04 — Control Flow
//  Topics: if, else if, else, switch, ternary, nesting
// ============================================================

void main() {

  // ── 1. IF / ELSE ──────────────────────────────────────────
  int temperature = 32;

  if (temperature > 30) {          // condition must be bool
    print('Hot day — drink water!');
  } else {
    print('Nice weather.');
  }
  // → Hot day — drink water!

  // ── 2. IF / ELSE IF / ELSE ────────────────────────────────
  // Dart checks conditions top to bottom, runs the FIRST match
  int score = 75;

  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');             // score=75 lands here
  } else {
    print('Grade: F');
  }
  // → Grade: C

  // ── 3. CONDITIONS WITH LOGICAL OPERATORS ──────────────────
  int age = 25;
  // fromUser() simulates a value Dart can't predict (defined below main)
  bool hasLicense = fromUser(true);

  if (age >= 18 && hasLicense) {   // both must be true
    print('You can drive.');
  } else if (age >= 18 && !hasLicense) {
    print('Get a license first.');
  } else {
    print('Too young to drive.');
  }
  // → You can drive.

  // ── 4. SWITCH ─────────────────────────────────────────────
  // Cleaner than long if/else chains when matching exact values
  String weekday = 'Saturday';

  switch (weekday) {
    case 'Saturday':               // matches this case
    case 'Sunday':                 // empty case falls through to next
      print('Weekend!');
      break;                       // break exits the switch
    case 'Friday':
      print('Almost weekend.');
      break;
    default:                       // runs when nothing matches
      print('Regular workday.');
  }
  // → Weekend!

  // ── 5. SWITCH WITH ENUM-LIKE VALUES ───────────────────────
  String status = 'loading';

  switch (status) {
    case 'loading':
      print('Show spinner...');    // in Flutter: show loading widget
      break;
    case 'success':
      print('Show data!');
      break;
    case 'error':
      print('Show error message.');
      break;
  }
  // → Show spinner...

  // ── 6. TERNARY OPERATOR ───────────────────────────────────
  // condition ? valueIfTrue : valueIfFalse — short one-line if/else
  int marks = 65;
  String result = marks >= 50 ? 'Pass' : 'Fail';
  print(result);                   // → Pass

  // Great for quick decisions inside strings
  int items = 1;
  print('You have $items ${items == 1 ? 'item' : 'items'}');
  // → You have 1 item

  // ── 7. NESTED CONDITIONS ──────────────────────────────────
  bool isLoggedIn = fromUser(true);
  bool isPremium = fromUser(false);

  if (isLoggedIn) {
    if (isPremium) {
      print('Welcome, premium user!');
    } else {
      print('Welcome! Upgrade to premium?'); // lands here
    }
  } else {
    print('Please log in.');
  }
  // → Welcome! Upgrade to premium?

  // TIP: deep nesting gets hard to read —
  // combining conditions with && is often cleaner:
  if (isLoggedIn && !isPremium) {
    print('Same check, flatter code.');
  }
}

// Simulates user input — in a real app this comes from outside,
// so Dart cannot predict the value at compile time
bool fromUser(bool value) {
  return value;
}
