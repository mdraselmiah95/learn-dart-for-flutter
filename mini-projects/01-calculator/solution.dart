// ============================================================
//  Mini Project 01 — Calculator (SOLUTION)
// ============================================================

void main() {
  print('Calculator');
  print('----------');
  print('10 + 5 = ${calculate(10, '+', 5)}');
  print('10 - 5 = ${calculate(10, '-', 5)}');
  print('10 * 5 = ${calculate(10, '*', 5)}');
  print('10 / 5 = ${calculate(10, '/', 5)}');
  print('10 % 3 = ${calculate(10, '%', 3)}');
  print('10 / 0 = ${calculate(10, '/', 0)}');
}

// Takes two numbers and an operator, returns the result as a String
String calculate(double a, String op, double b) {
  switch (op) {
    case '+':
      return _format(a + b);
    case '-':
      return _format(a - b);
    case '*':
      return _format(a * b);
    case '/':
      if (b == 0) return 'Error: Cannot divide by zero';
      return (a / b).toString();      // division keeps the decimal
    case '%':
      return _format(a % b);
    default:
      return 'Error: Unknown operator "$op"';
  }
}

// Show whole numbers without '.0' — 15.0 prints as 15
String _format(double value) {
  if (value == value.toInt()) {
    return value.toInt().toString();
  }
  return value.toString();
}
