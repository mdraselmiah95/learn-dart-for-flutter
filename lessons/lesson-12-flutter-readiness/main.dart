// ============================================================
//  Lesson 12 — Flutter Readiness
//  Topics: data models, fromJson/toJson, service classes,
//          immutability, the patterns every Flutter app uses
//
//  This lesson is a mini Flutter app — WITHOUT the UI.
//  Every pattern here appears in real Flutter code on day 1.
// ============================================================

Future<void> main() async {

  // ── 1. THE BIG PICTURE ────────────────────────────────────
  // A Flutter app is usually split into 3 layers:
  //   MODELS   — classes that describe your data (User, Product...)
  //   SERVICES — classes that fetch/store data (API, database)
  //   UI       — widgets that display the data (Flutter only)
  // Today you build the first two layers in pure Dart.

  // ── 2. CREATING MODELS ────────────────────────────────────
  const user = User(id: 1, name: 'Rasel', email: 'rasel@mail.com');
  print(user);                    // → User(1, Rasel, rasel@mail.com)

  // ── 3. JSON → MODEL (fromJson) ────────────────────────────
  // APIs send JSON — in Dart it arrives as Map<String, dynamic>
  Map<String, dynamic> json = {
    'id': 2,
    'name': 'Miah',
    'email': 'miah@mail.com',
  };

  User fromApi = User.fromJson(json);  // Map → typed object
  print(fromApi.name);            // → Miah (safe, typed access!)

  // ── 4. MODEL → JSON (toJson) ──────────────────────────────
  // Sending data TO an API — object back to a Map
  print(user.toJson());           // → {id: 1, name: Rasel, ...}

  // ── 5. copyWith — UPDATE WITHOUT MUTATING ─────────────────
  // Model fields are final (immutable). To "change" one,
  // make a COPY with some fields replaced.
  // Flutter state management (Riverpod, Bloc) relies on this!
  User renamed = user.copyWith(name: 'Rasel Miah');
  print(renamed);                 // → User(1, Rasel Miah, rasel@mail.com)
  print(user);                    // → original unchanged!

  // ── 6. SERVICE CLASS IN ACTION ────────────────────────────
  final service = UserService();

  print('\nLoading users...');    // in Flutter: show a spinner here
  List<User> users = await service.fetchUsers();
  print('Loaded ${users.length} users:');
  for (User u in users) {
    print('  $u');
  }

  // ── 7. SEARCHING AND FILTERING (UI logic) ─────────────────
  User? found = service.findByEmail(users, 'sara@mail.com');
  print('Found: ${found?.name ?? 'nobody'}');   // → Found: Sara

  User? missing = service.findByEmail(users, 'ghost@mail.com');
  print('Found: ${missing?.name ?? 'nobody'}'); // → Found: nobody

  // ── 8. ERROR HANDLING LIKE A REAL APP ─────────────────────
  try {
    await service.fetchUsers(simulateError: true);
  } catch (e) {
    // in Flutter: show an error message widget here
    print('Could not load users: $e');
  }

  print('\nYou are ready for Flutter! 🚀');
}

// ── MODEL LAYER ──────────────────────────────────────────────
// A model is a plain Dart class that describes one piece of data.
// Rules Flutter devs follow:
//   1. all fields final (immutable)
//   2. const constructor
//   3. fromJson / toJson for API work
//   4. copyWith for state updates
class User {
  final int id;
  final String name;
  final String email;

  const User({required this.id, required this.name, required this.email});

  // factory = constructor that builds the object from something else
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,          // 'as int' casts dynamic → int
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  // returns a new User, replacing only the fields you pass
  User copyWith({int? id, String? name, String? email}) {
    return User(
      id: id ?? this.id,              // null = keep current value
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'User($id, $name, $email)';
}

// ── SERVICE LAYER ────────────────────────────────────────────
// A service does the WORK: fetch from API, save to database.
// UI code never talks to the network directly — it asks a service.
class UserService {
  // In a real app this would be an http call:
  //   final response = await http.get(Uri.parse('$baseUrl/users'));
  Future<List<User>> fetchUsers({bool simulateError = false}) async {
    await Future.delayed(Duration(seconds: 1)); // simulate network delay

    if (simulateError) {
      throw Exception('No internet connection');
    }

    // APIs return JSON lists — List<Map<String, dynamic>>
    final List<Map<String, dynamic>> response = [
      {'id': 1, 'name': 'Rasel', 'email': 'rasel@mail.com'},
      {'id': 2, 'name': 'Sara', 'email': 'sara@mail.com'},
      {'id': 3, 'name': 'Karim', 'email': 'karim@mail.com'},
    ];

    // convert every Map into a typed User — THE classic Dart line:
    return response.map((json) => User.fromJson(json)).toList();
  }

  // pure logic — easy to test, reusable in any UI
  User? findByEmail(List<User> users, String email) {
    for (User user in users) {
      if (user.email == email) return user;
    }
    return null;                      // not found
  }
}
