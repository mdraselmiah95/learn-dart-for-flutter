// ============================================================
//  Lesson 10 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  Car car = Car('Toyota', 4);
  car.start();    // → Toyota is starting...
  car.honk();     // → Beep beep!

  // ── TASK 2 ────────────────────────────────────────────────
  ElectricCar tesla = ElectricCar('Tesla', 4);
  tesla.start();  // → Tesla starts silently.

  // ── TASK 3 ────────────────────────────────────────────────
  Manager boss = Manager('Ayesha');
  Developer dev = Developer('Rasel');
  boss.payslip(); // → Ayesha earns $5000.0
  dev.payslip();  // → Rasel earns $4000.0

  // ── TASK 4 ────────────────────────────────────────────────
  List<Employee> team = [boss, dev];
  for (Employee e in team) {
    e.payslip();  // each uses its own salary() — polymorphism
  }

  // ── TASK 5 ────────────────────────────────────────────────
  dev.writeCode();   // → Developer writes Dart!
  // boss.writeCode(); // ← ERROR: Manager has no CanCode mixin ✓
}

// ── Tasks 1–2 ────────────────────────────────────────────────
class Vehicle {
  String brand;
  Vehicle(this.brand);

  void start() {
    print('$brand is starting...');
  }
}

class Car extends Vehicle {
  int doors;
  Car(super.brand, this.doors);

  void honk() => print('Beep beep!');
}

class ElectricCar extends Car {
  ElectricCar(super.brand, super.doors);

  @override
  void start() => print('$brand starts silently.');
}

// ── Tasks 3–5 ────────────────────────────────────────────────
abstract class Employee {
  String name;
  Employee(this.name);

  double salary();               // abstract — children must implement

  void payslip() {               // concrete — inherited by all
    print('$name earns \$${salary()}');
  }
}

class Manager extends Employee {
  Manager(super.name);

  @override
  double salary() => 5000;
}

mixin CanCode {
  void writeCode() => print('$runtimeType writes Dart!');
}

class Developer extends Employee with CanCode {
  Developer(super.name);

  @override
  double salary() => 4000;
}
