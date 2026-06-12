# Lesson 10 — Inheritance, Abstract Classes & Mixins

## Learning Objectives

By the end of this lesson you will:
- Reuse code with `extends` and customize with `@override`
- Treat different objects uniformly (polymorphism)
- Force contracts on subclasses with `abstract`
- Share abilities across unrelated classes with `mixin`

---

## Inheritance — extends

Child gets everything the parent has, plus its own additions:

```dart
class Animal {
  String name;
  Animal(this.name);
  void eat() => print('$name is eating.');
}

class Dog extends Animal {
  String breed;                          // Dog-only property
  Dog(super.name, this.breed);          // super.name → parent constructor
  void fetch() => print('$name fetches!');  // Dog-only method
}

Dog rex = Dog('Rex', 'Beagle');
rex.eat();     // inherited ✓
rex.fetch();   // own ✓
```

---

## Overriding — replace the parent's version

```dart
class Cat extends Animal {
  Cat(super.name);

  @override                              // intentionally replacing
  void eat() => print('$name eats quietly.');
}
```

`@override` isn't just decoration — Dart errors if no matching parent method exists (catches typos!).

---

## Polymorphism — one type, many behaviors

```dart
List<Animal> shelter = [Dog('Rex', 'Beagle'), Cat('Kitty')];

for (Animal a in shelter) {
  a.eat();          // each object runs ITS OWN version!
}
```

This single idea powers Flutter's entire widget tree.

---

## Abstract Classes — contracts

Cannot be instantiated — exists to force children to implement methods:

```dart
abstract class Shape {
  double area();                         // NO body — children MUST implement

  void describe() {                      // concrete — inherited normally
    print('Area: ${area()}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;   // forced to implement ✓
}
```

`Shape s = Shape();` → compile error. `Circle(5).describe()` → works.

---

## Mixins — abilities à la carte

Inheritance is a tree: one parent only. Mixins add abilities sideways:

```dart
mixin CanFly {
  void fly() => print('Flying!');
}
mixin CanSwim {
  void swim() => print('Swimming!');
}

class Duck extends Animal with CanFly, CanSwim { ... }  // both!
class Fish extends Animal with CanSwim { ... }          // swim only
```

**When mixin vs extends?** extends = "IS A" (Dog is an Animal). mixin = "CAN DO" (Duck can fly).

---

## Common Mistakes

| Mistake | Problem |
|---------|---------|
| forgetting `super(...)` when parent needs args | compile error — parent must be initialized |
| omitting `@override` | works but silently hides typo bugs |
| instantiating an abstract class | compile error — create a subclass instead |
| deep inheritance chains (A→B→C→D) | fragile — prefer composition or mixins |

---

## Flutter Connection

This lesson explains how Flutter itself is built:

```dart
class MyApp extends StatelessWidget {      // extends — every widget!
  @override
  Widget build(BuildContext context) {     // @override — every widget!
    ...
  }
}

class _MyPageState extends State<MyPage>
    with TickerProviderStateMixin {        // mixin — animations!
```

`StatelessWidget` is an **abstract class** — `build()` is its abstract method you're forced to implement. You've been doing this lesson's content from Flutter day 1 without knowing it.

---

## Summary

- `extends` inherit · `@override` customize · polymorphism = each object its own behavior
- `abstract` = contract that can't be instantiated
- `mixin` + `with` = shared abilities without inheritance
- IS-A → extends · CAN-DO → mixin

---

## How to Run

```bash
dart run lessons/lesson-10-inheritance-abstract-mixin/main.dart
```

## Practice

Open `practice.dart` → solve all 5 tasks → check `solution.dart`.

---

⬅ [Lesson 09 — OOP Classes](../lesson-09-oop-classes/) · [Lesson 11 — Async](../lesson-11-async-future-streams/) ➡
