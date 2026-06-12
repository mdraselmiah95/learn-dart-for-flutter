# Setup Guide

Get Dart running on your machine in 5 minutes.

> **Want the full guide including Flutter?** See [Lesson 00 — Local Setup](lessons/lesson-00-setup/) — covers Dart + Flutter on Mac, Windows, and Linux, with troubleshooting.

---

## Option 1 — No Installation (Recommended for Beginners)

Use **DartPad** directly in your browser — no setup needed.

1. Go to [https://dartpad.dev](https://dartpad.dev)
2. Delete the existing code
3. Paste any `main.dart` from this repo
4. Click **Run**

Use DartPad for Lessons 01–05 while getting comfortable with the language.

---

## Option 2 — Install Dart Locally

### Mac

```bash
# Install with Homebrew
brew tap dart-lang/dart
brew install dart

# Verify
dart --version
```

### Windows

1. Download the Dart SDK from [https://dart.dev/get-dart](https://dart.dev/get-dart)
2. Run the installer
3. Open a new terminal and verify:

```cmd
dart --version
```

### Linux (Ubuntu/Debian)

```bash
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update
sudo apt-get install dart

# Verify
dart --version
```

---

## VS Code Setup (Recommended Editor)

1. Install [VS Code](https://code.visualstudio.com/)
2. Open VS Code → Extensions (`Cmd+Shift+X` or `Ctrl+Shift+X`)
3. Search **Dart** → Install the official Dart extension by Dart Code
4. Optionally install the **Flutter** extension (for later)

### VS Code Features You Get
- Syntax highlighting
- Auto-complete
- Inline error detection
- Format on save (`Shift+Alt+F`)
- Run button in terminal

---

## Run Your First File

```bash
# Clone this repo
git clone https://github.com/your-username/learn-dart-for-flutter.git
cd learn-dart-for-flutter

# Run lesson 01
dart run lessons/lesson-01-introduction/main.dart
```

Expected output:
```
Hello, Dart!
Welcome to learn-dart-for-flutter
```

---

## Verify Everything Works

```bash
dart --version
# Should print: Dart SDK version: 3.x.x
```

---

## Useful Dart Commands

```bash
dart run file.dart        # run a Dart file
dart analyze              # check for errors
dart format file.dart     # auto-format code
dart pub get              # install packages (later lessons)
```

---

> Once Dart runs correctly, go to [Lesson 01](lessons/lesson-01-introduction/).
