// ============================================================
//  Mini Project 03 — Expense Tracker (SOLUTION)
// ============================================================

void main() {
  print('=== Expense Tracker ===\n');

  final tracker = ExpenseTracker();

  tracker.addExpense('Coffee', 3.50, Category.food);
  tracker.addExpense('Uber', 12.00, Category.transport);
  tracker.addExpense('Books', 45.00, Category.education);
  tracker.addExpense('Lunch', 8.50, Category.food);
  tracker.addExpense('Bus ticket', 2.00, Category.transport);

  tracker.printSummary();
}

// ── ENUM — fixed set of category options ─────────────────────
enum Category { food, transport, education, entertainment }

// ── MODEL ────────────────────────────────────────────────────
class Expense {
  final String title;
  final double amount;
  final Category category;

  const Expense({
    required this.title,
    required this.amount,
    required this.category,
  });
}

// ── TRACKER — all the logic ──────────────────────────────────
class ExpenseTracker {
  final List<Expense> _expenses = [];

  void addExpense(String title, double amount, Category cat) {
    _expenses.add(Expense(title: title, amount: amount, category: cat));
    // .name gives the enum value as a String: Category.food → 'food'
    print('Added: $title  \$$amount  [${cat.name}]');
  }

  // fold = like reduce but starts from a given value (0 here)
  double totalAmount() {
    return _expenses.fold(0, (sum, e) => sum + e.amount);
  }

  // group totals per category into a Map
  Map<Category, double> byCategory() {
    Map<Category, double> totals = {};
    for (Expense e in _expenses) {
      // start at 0 if category not seen yet, then add
      totals[e.category] = (totals[e.category] ?? 0) + e.amount;
    }
    return totals;
  }

  // count how many expenses a category has
  int countIn(Category cat) {
    return _expenses.where((e) => e.category == cat).length;
  }

  Expense mostExpensive() {
    Expense biggest = _expenses.first;
    for (Expense e in _expenses) {
      if (e.amount > biggest.amount) biggest = e;
    }
    return biggest;
  }

  void printSummary() {
    print('\n--- Summary ---');
    print('Total expenses: \$${totalAmount().toStringAsFixed(2)}');

    print('\nBy category:');
    byCategory().forEach((cat, total) {
      int count = countIn(cat);
      String items = count == 1 ? 'item' : 'items';
      print('  ${cat.name}: \$${total.toStringAsFixed(2)} ($count $items)');
    });

    Expense top = mostExpensive();
    print('\nMost expensive: ${top.title} - \$${top.amount.toStringAsFixed(2)}');
  }
}
