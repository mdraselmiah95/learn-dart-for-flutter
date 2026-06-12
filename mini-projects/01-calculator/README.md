# Mini Project 01 — Calculator

## Goal
Build a Dart calculator that performs basic math operations on two numbers.

## Concepts Used
- Functions with parameters and return values
- Operators: `+` `-` `*` `/` `%`
- `switch` for operation selection
- Error handling for division by zero

## Folder Structure
```
01-calculator/
├── README.md
├── calculator.dart      ← build this yourself
└── solution.dart        ← check after you try
```

## Expected Output
```
Calculator
----------
10 + 5 = 15
10 - 5 = 5
10 * 5 = 50
10 / 5 = 2.0
10 % 3 = 1
10 / 0 = Error: Cannot divide by zero
```

## Requirements
- Create a `calculate(double a, String op, double b)` function
- It should return a `String` result
- Handle `+`, `-`, `*`, `/`, `%`
- Return an error message for division by zero
- Call it at least 5 times in `main()` with different values

## Flutter Connection
In Flutter, calculator logic lives in a service class. The UI calls the logic and displays the result — exactly the same function you write here, just connected to a button and a text widget.
