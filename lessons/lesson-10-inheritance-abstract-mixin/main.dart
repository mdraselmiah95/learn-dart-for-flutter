// ============================================================
//  Lesson 10 — Inheritance, Abstract Classes & Mixins
//  Topics: extends, super, @override, abstract,
//          implements, mixin, with
// ============================================================

void main() {

  // ── 1. INHERITANCE — extends ──────────────────────────────
  // Dog gets everything Animal has, plus its own additions
  Dog rex = Dog('Rex', 'German Shepherd');

  rex.eat();                      // inherited from Animal
  rex.fetch();                    // Dog's own method
  print(rex.name);                // inherited property
  // → Rex is eating. / Rex fetches the ball! / Rex

  // ── 2. OVERRIDING — replace the parent's version ──────────
  Cat kitty = Cat('Kitty');

  kitty.eat();                    // Cat REPLACED Animal's eat()
  // → Kitty eats quietly, like a cat.

  // ── 3. POLYMORPHISM — treat children as the parent type ───
  // One list holds Dogs AND Cats — both ARE Animals
  List<Animal> shelter = [rex, kitty, Dog('Buddy', 'Beagle')];

  for (Animal animal in shelter) {
    animal.eat();                 // each runs its OWN version!
  }
  // This is the core idea behind Flutter's widget tree —
  // everything is a Widget, each draws itself differently.

  // ── 4. ABSTRACT CLASS ─────────────────────────────────────
  // Shape shape = Shape();       // ← ERROR: cannot create abstract class
  Circle circle = Circle(5);
  Square square = Square(4);

  print(circle.area());           // → 78.5
  print(square.area());           // → 16.0
  circle.describe();              // inherited concrete method
  // → This shape has area 78.5

  // ── 5. MIXIN — share behavior without inheritance ─────────
  Duck duck = Duck('Donald');
  duck.eat();                     // from Animal (extends)
  duck.fly();                     // from CanFly (mixin)
  duck.swim();                    // from CanSwim (mixin)
  // → Donald is eating. / Donald flies! / Donald swims!

  // Fish only swims — pick exactly the abilities you need
  Fish nemo = Fish('Nemo');
  nemo.swim();                    // → Nemo swims!
  // nemo.fly();                  // ← ERROR: Fish has no CanFly
}

// ── BASE CLASS ───────────────────────────────────────────────
class Animal {
  String name;

  Animal(this.name);

  void eat() {
    print('$name is eating.');
  }
}

// ── INHERITANCE with extends ─────────────────────────────────
class Dog extends Animal {
  String breed;                   // extra property only Dog has

  // super(name) passes name up to Animal's constructor
  Dog(String name, this.breed) : super(name);

  void fetch() {
    print('$name fetches the ball!');
  }
}

class Cat extends Animal {
  // super.name = modern shorthand for passing to parent constructor
  Cat(super.name);

  // @override = we are intentionally replacing Animal's eat()
  @override
  void eat() {
    print('$name eats quietly, like a cat.');
  }
}

// ── ABSTRACT CLASS ───────────────────────────────────────────
// Cannot be instantiated — exists to force a contract on children
abstract class Shape {
  double area();                  // ABSTRACT: no body, children MUST implement

  void describe() {               // CONCRETE: has a body, gets inherited
    print('This shape has area ${area()}');
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;  // must implement
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double area() => side * side;             // must implement
}

// ── MIXINS — reusable ability blocks ─────────────────────────
// 'mixin' defines behaviors a class can opt into with 'with'
mixin CanFly {
  // mixins can't have constructors, but can have methods/fields
  void fly() {
    print('$runtimeType flies!');  // runtimeType = actual class name
  }
}

mixin CanSwim {
  void swim() {
    print('$runtimeType swims!');
  }
}

// extends ONE class, mixes in MANY abilities
class Duck extends Animal with CanFly, CanSwim {
  Duck(super.name);

  // Make mixin messages use the duck's name instead
  @override
  void fly() => print('$name flies!');
  @override
  void swim() => print('$name swims!');
}

class Fish extends Animal with CanSwim {
  Fish(super.name);

  @override
  void swim() => print('$name swims!');
}
