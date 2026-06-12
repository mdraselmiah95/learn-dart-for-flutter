// ============================================================
//  Lesson 10 — Practice Tasks
//  Try each task yourself before checking solution.dart
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  // Create a class Vehicle with String brand and a method
  // start() that prints '[brand] is starting...'.
  // Create a class Car that extends Vehicle and adds
  // int doors and a method honk() printing 'Beep beep!'.
  // In main: create a Car, call start() and honk().


  // ── TASK 2 ────────────────────────────────────────────────
  // Create ElectricCar extending Car.
  // Override start() to print '[brand] starts silently.'
  // Create one and call start().


  // ── TASK 3 ────────────────────────────────────────────────
  // Create an abstract class Employee with:
  // - String name
  // - abstract method double salary()
  // - concrete method payslip() printing '[name] earns $[salary()]'
  // Create Manager (salary 5000) and Developer (salary 4000)
  // extending Employee. Call payslip() on both.


  // ── TASK 4 ────────────────────────────────────────────────
  // Put a Manager and a Developer in a List<Employee>.
  // Loop and call payslip() on each (polymorphism).


  // ── TASK 5 (Challenge) ────────────────────────────────────
  // Create a mixin CanCode with method writeCode()
  // printing '[runtimeType] writes Dart!'.
  // Apply it to Developer only (with CanCode).
  // Call writeCode() on a Developer.
  // Verify a Manager CANNOT call writeCode().

}
