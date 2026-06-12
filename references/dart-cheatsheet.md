# Dart Cheat Sheet — Everything on One Page

## Variables

```dart
var x = 5;                  // inferred, type locks after assignment
String s = 'text';          // explicit type
final f = 'once';           // set once (runtime)
const c = 3.14;             // set once (compile time)
dynamic d = 'anything';     // any type, can change — avoid
String? n;                  // nullable
late String l;              // assign before first use
```

## Types

```dart
int i = 42;            double d = 3.14;       num both = 1;
bool b = true;         String s = 'hi';
List<int> li = [1,2];  Map<String,int> m = {'a':1};   Set<int> st = {1,2};
```

## String Interpolation

```dart
print('name: $name');           // variable
print('sum: ${a + b}');         // expression
String multi = '''multi
line''';
```

## Operators

```dart
+ - * / % ~/        // ~/ = integer division, / always returns double
== != > < >= <=     // comparison → bool
&& || !             // logic
?? ??= ?. !         // null toolkit
is is! as           // type test / cast
```

## Control Flow

```dart
if (x > 5) {} else if (x > 0) {} else {}

switch (v) { case 'a': ...; break; default: ...; }

String r = ok ? 'yes' : 'no';        // ternary
```

## Loops

```dart
for (int i = 0; i < 5; i++) {}
for (var item in list) {}
while (cond) {}
do {} while (cond);
break;     // exit loop
continue;  // skip round
```

## Functions

```dart
int add(int a, int b) => a + b;                    // arrow
void f({required String name, int age = 0}) {}     // named + default
var anon = (int x) => x * 2;                       // anonymous
void hof(void Function() callback) => callback();  // higher-order
```

## Collections

```dart
list.add(x); list.remove(x); list[0]; list.length;
list.contains(x); list.first; list.last; list.sort();

map['key'];  map['key'] = v;  map.keys;  map.values;

list.map((e) => e * 2).toList();
list.where((e) => e > 4).toList();
list.reduce((a, b) => a + b);
list.any((e) => e > 8);   list.every((e) => e > 0);

var merged = [...a, ...b];                  // spread
var menu = [if (vip) 'deal', for (var x in xs) x];  // collection if/for
```

## Null Safety

```dart
String? maybe;                 // nullable
maybe ?? 'default'             // fallback
maybe ??= 'assign if null';
maybe?.length                  // safe access
maybe!                         // force (can crash!)
if (maybe != null) { /* promoted to String here */ }
list.whereType<String>()       // drop nulls
```

## Classes

```dart
class Person {
  final String name;
  int age;
  Person(this.name, this.age);            // constructor shorthand
  Person.guest() : name = 'Guest', age = 0;  // named constructor

  String get info => '$name ($age)';      // getter
  void birthday() => age++;               // method

  @override
  String toString() => 'Person($name)';
}
```

## OOP Keywords

```dart
class Dog extends Animal {}        // inherit
@override void eat() {}            // replace parent's version
abstract class Shape {}            // can't instantiate, forces contract
class A implements B {}            // implement interface
mixin CanFly {}                    // ability block
class Duck extends Animal with CanFly, CanSwim {}
```

## Error Handling

```dart
try { risky(); }
on FormatException { ... }         // specific type
catch (e) { ... }                  // anything
finally { cleanup(); }             // always runs

throw Exception('message');
```

## Async

```dart
Future<String> fetch() async {
  await Future.delayed(Duration(seconds: 1));
  return 'data';
}

final x = await fetch();                        // wait for it
final list = await Future.wait([f1(), f2()]);   // parallel

Stream<int> count() async* { yield 1; }         // stream
await for (var n in count()) {}                 // consume
```

## Model Pattern (Flutter-ready)

```dart
class User {
  final int id;
  final String name;
  const User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> j) =>
      User(id: j['id'] as int, name: j['name'] as String);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  User copyWith({int? id, String? name}) =>
      User(id: id ?? this.id, name: name ?? this.name);
}
```

## Commands

```bash
dart run file.dart      # run
dart analyze            # check for issues
dart format .           # auto-format
dart pub add http       # add package
dart pub get            # install packages
```
