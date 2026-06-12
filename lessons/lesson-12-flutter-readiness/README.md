# Lesson 12 — Flutter Readiness

## Learning Objectives

The final Dart lesson. By the end you will:
- Structure code the way real Flutter apps do: models / services / UI
- Convert JSON ↔ Dart objects with `fromJson` / `toJson`
- Update immutable state with `copyWith`
- Use `pubspec.yaml` and pub.dev packages
- Recognize every pattern you'll meet on Flutter day 1

---

## The 3-Layer Architecture

```
┌─────────────────────────────┐
│  UI (Flutter widgets)        │  ← the only part you DON'T know yet
├─────────────────────────────┤
│  SERVICES (fetch/store data) │  ← this lesson
├─────────────────────────────┤
│  MODELS (describe the data)  │  ← this lesson
└─────────────────────────────┘
```

You build the bottom two layers in pure Dart today. Flutter only adds the top.

---

## Models — the data blueprint

A production-quality model follows 4 rules:

```dart
class User {
  final int id;                  // 1. all fields final (immutable)
  final String name;

  const User({required this.id, required this.name});  // 2. const constructor

  factory User.fromJson(Map<String, dynamic> json) {   // 3. JSON in
    return User(id: json['id'] as int, name: json['name'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};  // JSON out

  User copyWith({int? id, String? name}) {              // 4. copyWith
    return User(id: id ?? this.id, name: name ?? this.name);
  }
}
```

**Why copyWith?** Fields are final — you can't change them. Instead you create a copy with some values replaced:

```dart
User renamed = user.copyWith(name: 'New Name');  // original untouched
```

Every Flutter state management library (Riverpod, Bloc) is built on this pattern.

---

## Services — the work layer

```dart
class UserService {
  Future<List<User>> fetchUsers() async {
    // real app: final res = await http.get(url);
    final response = await fakeApi();

    // THE classic line — JSON list → typed objects:
    return response.map((json) => User.fromJson(json)).toList();
  }
}
```

UI never talks to the network directly. It asks a service. This separation makes code testable and reusable.

---

## pubspec.yaml — Dart's package manager

Every Dart/Flutter project has a `pubspec.yaml` — like a shopping list of packages:

```yaml
name: my_app
environment:
  sdk: ^3.0.0

dependencies:
  http: ^1.2.0        # network requests — from pub.dev
```

```bash
dart pub get          # download the packages
dart pub add http     # add a new one from the command line
```

Browse packages at [pub.dev](https://pub.dev) — Flutter's npm.

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| `json['price'] as double` when API sends `5` | int isn't double — use `(json['price'] as num).toDouble()` |
| mutable model fields | breaks state management — keep fields final |
| API calls inside UI code | untestable spaghetti — use a service class |
| forgetting `copyWith` returns a NEW object | the original never changes; use the returned copy |

---

## Flutter Connection — you are ready

After this lesson you already know what these Flutter snippets do:

```dart
// you know: classes, named params, const constructors
const Text('Hello', style: TextStyle(fontSize: 20))

// you know: async, services, models, fromJson
final users = await userService.fetchUsers();

// you know: map → toList
children: users.map((u) => UserTile(u)).toList()

// you know: ternary, null safety
title: Text(user?.name ?? 'Guest')
```

The only new things Flutter adds: widgets and layout. The language work is done.

---

## Summary

- Model = final fields + const constructor + fromJson/toJson + copyWith
- Service = async class that fetches and returns typed models
- pubspec.yaml + pub.dev = Dart's package system
- Next stop: `flutter create my_first_app` 🚀

---

## How to Run

```bash
dart run lessons/lesson-12-flutter-readiness/main.dart
```

## Practice

Open `practice.dart` → build the Product catalog → check `solution.dart`.

---

⬅ [Lesson 11 — Async](../lesson-11-async-future-streams/) · [Mini Projects](../../mini-projects/) ➡
