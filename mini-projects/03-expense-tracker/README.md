# Mini Project 03 — Expense Tracker

## Goal
Build expense tracking logic — add expenses, categorize them, and show a summary.

## Concepts Used
- Classes (`Expense` model)
- Enums for categories
- `List` and `Map` operations
- Filtering, grouping, summing
- Formatted output with string interpolation

## Folder Structure
```
03-expense-tracker/
├── README.md
├── expense_tracker.dart   ← build this yourself
└── solution.dart          ← check after you try
```

## Expected Output
```
=== Expense Tracker ===

Added: Coffee        $3.50  [Food]
Added: Uber          $12.00 [Transport]
Added: Books         $45.00 [Education]
Added: Lunch         $8.50  [Food]
Added: Bus ticket    $2.00  [Transport]

--- Summary ---
Total expenses: $71.00

By category:
  Food:        $12.00 (2 items)
  Transport:   $14.00 (2 items)
  Education:   $45.00 (1 item)

Most expensive: Books - $45.00
```

## Requirements
- Create an `enum Category` with at least 4 categories
- Create an `Expense` class with `title`, `amount`, `category`
- Create an `ExpenseTracker` class with:
  - `addExpense(String title, double amount, Category cat)`
  - `totalAmount()` returns double
  - `byCategory()` returns `Map<Category, double>`
  - `mostExpensive()` returns `Expense`
  - `printSummary()`

## Flutter Connection
In Flutter, this becomes an app with a form to add expenses and a summary screen. The `Expense` model and `ExpenseTracker` service are reused unchanged — just the UI layer is added.
