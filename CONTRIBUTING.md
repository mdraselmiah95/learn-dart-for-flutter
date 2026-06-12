# How to Update & Add New Things

This file is your personal guide for keeping the repository growing.
Use it every time you want to add a lesson, fix something, or improve content.

---

## Add a New Lesson

### Step 1 — Create the folder
```bash
# Replace XX with lesson number, name with topic
mkdir -p lessons/lesson-XX-topic-name
```

### Step 2 — Create the 4 required files
```bash
touch lessons/lesson-XX-topic-name/README.md
touch lessons/lesson-XX-topic-name/main.dart
touch lessons/lesson-XX-topic-name/practice.dart
touch lessons/lesson-XX-topic-name/solution.dart
```

### Step 3 — Follow this checklist for each file

**README.md must have:**
- [ ] Lesson title and number
- [ ] Learning objectives (bullet list)
- [ ] Concept explanation with code snippets
- [ ] Flutter connection section
- [ ] Common mistakes table
- [ ] How to run command

**main.dart must have:**
- [ ] Top comment block with lesson number and topics
- [ ] Every section separated with `// ── SECTION ──` headers
- [ ] Inline comment on every meaningful line
- [ ] Expected output shown as `// → output`

**practice.dart must have:**
- [ ] At least 5 tasks
- [ ] One challenge task at the end
- [ ] Comment-only tasks (learner writes the code)

**solution.dart must have:**
- [ ] Working solution for every practice task
- [ ] Same inline comment style as main.dart

### Step 4 — Update README.md lesson table
Open `README.md` and add the new lesson to the lessons table:
```markdown
| 03 | [Operators](lessons/lesson-03-operators/) | Arithmetic, comparison, logical, null-aware |
```

---

## Update an Existing Lesson

### Fix a bug in main.dart or solution.dart
1. Open the file
2. Fix the issue
3. Run to confirm: `dart run lessons/lesson-XX-name/main.dart`

### Add more examples to main.dart
- Add a new section with `// ── NEW SECTION ──` header
- Keep examples simple and beginner-focused
- Add inline comments on every new line

### Improve a README.md
- Keep the same section structure
- Do not remove existing sections — only add or improve

---

## Add a New Exercise

1. Create a file in `exercises/`:
```bash
touch exercises/exercise-XX-topic.dart
```

2. File format:
```dart
// Exercise XX — Topic Name
// Difficulty: Beginner / Intermediate
// Related lesson: lesson-XX

// TASK: (describe what to build)
// Expected output: (show what it should print)

void main() {
  // write your solution here
}
```

3. Update `exercises/README.md` table

---

## Add a New Mini Project

1. Create folder:
```bash
mkdir -p mini-projects/04-project-name
touch mini-projects/04-project-name/README.md
touch mini-projects/04-project-name/main.dart
touch mini-projects/04-project-name/solution.dart
```

2. README.md must include:
- [ ] Goal
- [ ] Concepts used
- [ ] Expected output (full example)
- [ ] Requirements (what classes/functions to build)
- [ ] Flutter connection

3. Update `mini-projects/README.md` table

---

## Add a Reference or Cheat Sheet

1. Create file in `references/`:
```bash
touch references/topic-cheatsheet.md
```

2. Update `references/README.md` table

---

## Naming Rules

| Thing | Format | Example |
|-------|--------|---------|
| Lesson folder | `lesson-XX-kebab-case` | `lesson-03-operators` |
| Exercise file | `exercise-XX-topic.dart` | `exercise-01-variables.dart` |
| Mini project folder | `XX-kebab-case` | `04-student-grades` |
| Dart files | `snake_case.dart` | `expense_tracker.dart` |
| Classes | `PascalCase` | `ExpenseTracker` |
| Variables/functions | `camelCase` | `totalAmount` |
| Constants | `camelCase` | `maxUsers` |

---

## Code Style Rules

- Explicit types over `var` in examples (more educational)
- Comment every meaningful line
- Show expected output: `print(x); // → 42`
- Section headers: `// ── SECTION NAME ─────────`
- No over-complex examples — one concept at a time
- Use real-life names: `userName`, `productPrice`, `isLoggedIn`

---

## Quality Checklist (run before finishing any update)

- [ ] Code runs without errors: `dart run lessons/lesson-XX/main.dart`
- [ ] No unused variables (Dart warns about these)
- [ ] No dead code (Dart warns about these)
- [ ] All practice tasks have solutions in solution.dart
- [ ] README.md updated if lesson table changed
- [ ] roadmap.md still accurate

---

## Future Updates Tracker

Use this section to note things you want to add or fix later.

### Lessons to Complete
- [x] lesson-03-operators — main.dart, practice.dart, solution.dart ✓
- [x] lesson-04-control-flow — main.dart, practice.dart, solution.dart ✓
- [x] lesson-05-loops — main.dart, practice.dart, solution.dart ✓
- [x] lesson-06-functions — main.dart, practice.dart, solution.dart ✓
- [x] lesson-07-collections — main.dart, practice.dart, solution.dart ✓
- [x] lesson-08-null-safety — main.dart, practice.dart, solution.dart ✓
- [x] lesson-09-oop-classes — main.dart, practice.dart, solution.dart ✓
- [x] lesson-10-inheritance-abstract-mixin — main.dart, practice.dart, solution.dart ✓
- [x] lesson-11-async-future-streams — main.dart, practice.dart, solution.dart ✓
- [x] lesson-12-flutter-readiness — main.dart, practice.dart, solution.dart ✓

### Mini Projects to Build
- [x] 01-calculator — starter calculator.dart + solution.dart ✓
- [x] 02-todo-logic — starter todo_app.dart + solution.dart ✓
- [x] 03-expense-tracker — starter expense_tracker.dart + solution.dart ✓

### Exercises to Add
- [ ] exercise-01-variables.dart
- [ ] exercise-02-operators.dart
- [ ] exercise-03-control-flow.dart

### References to Write
- [ ] references/dart-cheatsheet.md
- [ ] references/null-safety-guide.md

### Ideas for Later
- Add a `lesson-00-why-dart/` intro lesson
- Add diagrams to assets/ explaining OOP concepts
- Add a `glossary.md` with Dart terms for beginners
