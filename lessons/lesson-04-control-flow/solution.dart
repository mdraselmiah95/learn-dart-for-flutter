// ============================================================
//  Lesson 04 — Solutions
//  Try practice.dart yourself before reading this!
// ============================================================

void main() {

  // ── TASK 1 ────────────────────────────────────────────────
  int number = 7;
  if (number % 2 == 0) {     // remainder 0 = divisible by 2 = even
    print('Even');
  } else {
    print('Odd');            // → Odd
  }

  // ── TASK 2 ────────────────────────────────────────────────
  int marks = 82;
  if (marks >= 90) {
    print('A+');
  } else if (marks >= 80) {
    print('A');              // → A
  } else if (marks >= 70) {
    print('B');
  } else if (marks >= 60) {
    print('C');
  } else {
    print('F');
  }

  // ── TASK 3 ────────────────────────────────────────────────
  String month = 'July';
  switch (month) {
    case 'December':
    case 'January':
    case 'February':
      print('Winter');
      break;
    case 'March':
    case 'April':
    case 'May':
      print('Spring');
      break;
    case 'June':
    case 'July':
    case 'August':
      print('Summer');       // → Summer
      break;
    case 'September':
    case 'October':
    case 'November':
      print('Autumn');
      break;
    default:
      print('Invalid month');
  }

  // ── TASK 4 ────────────────────────────────────────────────
  int balance = 500;
  int price = 750;
  print(balance >= price ? 'Purchase successful' : 'Insufficient balance');
  // → Insufficient balance

  // ── TASK 5 ────────────────────────────────────────────────
  // wrapped in a function so the values look dynamic to the analyzer
  checkDiscount(true, 150);
}

void checkDiscount(bool isMember, double total) {
  double discount;           // percentage as decimal

  if (isMember && total >= 100) {
    discount = 0.20;         // 20% — lands here
  } else if (isMember) {
    discount = 0.10;
  } else if (total >= 100) {
    discount = 0.05;
  } else {
    discount = 0.0;
  }

  double finalPrice = total - (total * discount); // 150 - 30 = 120
  print('Final price: $finalPrice');  // → Final price: 120.0
}
