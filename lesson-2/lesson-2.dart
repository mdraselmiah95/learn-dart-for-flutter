void main() {
  // ==========================================
  // 1. var — type inferred, can reassign
  // ==========================================
  var name = 'Rasel';
  var age = 25;
  name = 'Miah'; // OK — same type
  print('var: $name, $age');

  // ==========================================
  // 2. String — text
  // ==========================================
  String city = 'Dhaka';
  String greeting = 'Hello, $city!'; // string interpolation
  print('String: $greeting');

  // ==========================================
  // 3. int — whole numbers
  // ==========================================
  int score = 100;
  int negative = -50;
  print('int: $score, $negative');

  // ==========================================
  // 4. double — decimal numbers
  // ==========================================
  double price = 9.99;
  double pi = 3.14159;
  print('double: $price, $pi');

  // ==========================================
  // 5. num — can hold int OR double
  // ==========================================
  num x = 10;     // acts as int
  num y = 10.5;   // acts as double
  print('num: $x, $y');

  // ==========================================
  // 6. bool — true or false only
  // ==========================================
  bool isLoggedIn = true;
  bool hasError = false;
  print('bool: $isLoggedIn, $hasError');

  // ==========================================
  // 7. final — set once, cannot reassign
  // ==========================================
  final String country = 'Bangladesh';
  // country = 'India'; // ERROR — cannot reassign final
  print('final: $country');

  // ==========================================
  // 8. const — compile-time constant
  // ==========================================
  const double gravity = 9.8;
  const int maxUsers = 100;
  // gravity = 10; // ERROR — cannot reassign const
  print('const: $gravity, $maxUsers');

  // ==========================================
  // 9. dynamic — any type, can change type
  // ==========================================
  dynamic data = 'Hello';
  print('dynamic (String): $data');
  data = 42;        // OK — type changed to int
  print('dynamic (int): $data');
  data = true;      // OK — type changed to bool
  print('dynamic (bool): $data');

  // ==========================================
  // 10. Nullable (?) — variable can be null
  // ==========================================
  String? nullableName = null; // OK with '?'
  int? nullableAge;            // default null
  print('nullable: $nullableName, $nullableAge');

  nullableName = 'Rasel'; // can assign later
  print('nullable after assign: $nullableName');

  // ==========================================
  // 11. late — declare now, assign later
  // ==========================================
  late String description;
  description = 'Dart is awesome!'; // must assign before use
  print('late: $description');

  // ==========================================
  // 12. List — ordered collection
  // ==========================================
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  var numbers = [1, 2, 3, 4, 5];
  print('List: $fruits');
  print('List: $numbers');

  // ==========================================
  // 13. Map — key-value pairs
  // ==========================================
  Map<String, int> marks = {
    'Math': 90,
    'English': 85,
    'Science': 92,
  };
  print('Map: $marks');

  // ==========================================
  // 14. Set — unique values only, no duplicates
  // ==========================================
  Set<String> colors = {'Red', 'Green', 'Blue', 'Red'}; // 'Red' stored once
  print('Set: $colors'); // {Red, Green, Blue}
}
