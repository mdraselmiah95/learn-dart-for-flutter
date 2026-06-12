// ============================================================
//  Lesson 07 — Collections
//  Topics: List, Set, Map, spread operator, collection methods
// ============================================================

void main() {

  // ── 1. LIST — ordered, allows duplicates ──────────────────
  List<String> fruits = ['Apple', 'Banana', 'Mango'];

  // Access by index — starts at 0
  print(fruits[0]);              // → Apple
  print(fruits.first);           // → Apple
  print(fruits.last);            // → Mango
  print(fruits.length);          // → 3

  // Add and remove
  fruits.add('Orange');          // add to the end
  print(fruits);                 // → [Apple, Banana, Mango, Orange]
  fruits.remove('Banana');       // remove by value
  print(fruits);                 // → [Apple, Mango, Orange]
  fruits.removeAt(0);            // remove by index
  print(fruits);                 // → [Mango, Orange]
  fruits.insert(0, 'Lychee');    // insert at position
  print(fruits);                 // → [Lychee, Mango, Orange]

  // Check contents
  print(fruits.contains('Mango'));  // → true
  print(fruits.indexOf('Orange'));  // → 2
  print(fruits.isEmpty);            // → false
  print(fruits.isNotEmpty);         // → true

  // ── 2. SET — unique values, no duplicates ─────────────────
  Set<int> ids = {101, 102, 103};

  ids.add(104);                  // adds normally
  ids.add(101);                  // already exists — silently ignored
  print(ids);                    // → {101, 102, 103, 104}

  print(ids.contains(102));      // → true (Set lookup is FAST)

  // Set operations
  Set<int> groupA = {1, 2, 3, 4};
  Set<int> groupB = {3, 4, 5, 6};
  print(groupA.intersection(groupB)); // → {3, 4}  in both
  print(groupA.union(groupB));        // → {1,2,3,4,5,6} combined
  print(groupA.difference(groupB));   // → {1, 2}  only in A

  // Quick trick: remove duplicates from a List
  List<int> withDupes = [1, 2, 2, 3, 3, 3];
  List<int> unique = withDupes.toSet().toList();
  print(unique);                 // → [1, 2, 3]

  // ── 3. MAP — key-value pairs ──────────────────────────────
  Map<String, int> marks = {
    'Math': 90,
    'English': 85,
  };

  // Access, add, update
  print(marks['Math']);          // → 90 (access by key)
  marks['Science'] = 95;         // add new pair
  marks['Math'] = 92;            // update existing
  print(marks);                  // → {Math: 92, English: 85, Science: 95}

  marks.remove('English');       // remove by key
  print(marks);                  // → {Math: 92, Science: 95}

  // Useful properties
  print(marks.keys);             // → (Math, Science)
  print(marks.values);           // → (92, 95)
  print(marks.containsKey('Math'));  // → true
  print(marks['History']);       // → null (missing key = null, no crash)

  // Loop through a Map
  marks.forEach((subject, mark) {
    print('$subject scored $mark');
  });

  // ── 4. SPREAD OPERATOR (...) ──────────────────────────────
  // Copies all items of one collection into another
  List<int> firstHalf = [1, 2, 3];
  List<int> secondHalf = [4, 5, 6];
  List<int> full = [...firstHalf, ...secondHalf];
  print(full);                   // → [1, 2, 3, 4, 5, 6]

  // Collection-if: include an item only when condition is true
  bool addBonus = true;
  List<String> menu = [
    'Burger',
    'Pizza',
    if (addBonus) 'Free Drink',  // included only if true
  ];
  print(menu);                   // → [Burger, Pizza, Free Drink]

  // Collection-for: build items inside the list literal
  List<int> squares = [for (int i = 1; i <= 5; i++) i * i];
  print(squares);                // → [1, 4, 9, 16, 25]

  // ── 5. POWER METHODS ──────────────────────────────────────
  List<int> numbers = [5, 3, 8, 1, 9];

  numbers.sort();                          // sorts in place
  print(numbers);                          // → [1, 3, 5, 8, 9]

  print(numbers.map((n) => n * 2).toList());     // → [2, 6, 10, 16, 18]
  print(numbers.where((n) => n > 4).toList());   // → [5, 8, 9]
  print(numbers.reduce((a, b) => a + b));        // → 26 (sum)
  print(numbers.any((n) => n > 8));        // → true  (at least one matches)
  print(numbers.every((n) => n > 0));      // → true  (ALL must match)
  print(numbers.firstWhere((n) => n > 4)); // → 5     (first match)
  print(numbers.take(2).toList());         // → [1, 3] (first 2)
  print(numbers.skip(2).toList());         // → [5, 8, 9] (skip first 2)
  print(numbers.reversed.toList());        // → [9, 8, 5, 3, 1]
}
