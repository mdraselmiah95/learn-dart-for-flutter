# Lesson 00 — Local Setup: Dart & Flutter (Mac, Windows, Linux)

## Learning Objectives

By the end of this lesson you will have:
- Dart SDK installed and working
- Flutter SDK installed (includes Dart — recommended path!)
- VS Code configured with the right extensions
- Verified everything with one command

---

## The Easy Way: Install Flutter (Dart comes free!)

**Key fact:** The Flutter SDK **includes the full Dart SDK**. Install Flutter once → you get both. This is the recommended path since your goal is Flutter anyway.

```
Install Flutter  ──────►  Dart included automatically ✓
```

If you only want Dart for now, the Dart-only option is also below.

---

## Option A — Flutter SDK (Recommended)

### Mac

```bash
# 1. Install Homebrew if you don't have it (one-time)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Flutter (includes Dart)
brew install --cask flutter

# 3. Verify
flutter --version
dart --version
```

**Apple Silicon (M1/M2/M3) extra step:**
```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

### Windows

1. Download the Flutter SDK zip from [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows)
2. Extract to `C:\dev\flutter` (avoid `C:\Program Files` — permission issues!)
3. Add Flutter to PATH:
   - Search **"Edit environment variables"** in Start menu
   - Under *User variables* → select `Path` → **Edit** → **New**
   - Add: `C:\dev\flutter\bin`
   - Click OK on everything
4. Open a **new** terminal (PowerShell) and verify:

```powershell
flutter --version
dart --version
```

### Linux (Ubuntu/Debian)

```bash
# 1. Easiest: install via snap
sudo snap install flutter --classic

# 2. Initialize and verify
flutter --version
dart --version
```

Or manual install:
```bash
# download and extract
cd ~
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_stable.tar.xz
mkdir -p ~/dev && tar xf flutter_linux_stable.tar.xz -C ~/dev

# add to PATH permanently
echo 'export PATH="$HOME/dev/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

flutter --version
```

---

## Option B — Dart SDK Only (lighter, no Flutter yet)

### Mac
```bash
brew tap dart-lang/dart
brew install dart
dart --version
```

### Windows
```powershell
# with winget (built into Windows 10/11)
winget install -e --id=Google.DartSDK
dart --version
```

### Linux
```bash
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update && sudo apt-get install dart
dart --version
```

---

## VS Code Setup (all platforms)

1. Install [VS Code](https://code.visualstudio.com/)
2. Open Extensions panel: `Cmd+Shift+X` (Mac) / `Ctrl+Shift+X` (Win/Linux)
3. Install:
   - **Dart** (by Dart Code) — required
   - **Flutter** (by Dart Code) — for later

**What you get:** autocomplete, error checking while typing, hover docs, format on save, and a Run button above every `main()`.

---

## Verify Your Setup

Run the verification file in this folder:

```bash
dart run lessons/lesson-00-setup/main.dart
```

Expected output:
```
✓ Dart is working!
✓ Version: 3.x.x
✓ Platform: macos (or windows / linux)
You are ready for Lesson 01!
```

If you installed Flutter, also run the full doctor check:

```bash
flutter doctor
```

`flutter doctor` shows a checklist — for **Dart lessons you only need the Flutter checkmark**. Android toolchain / Xcode warnings can wait until you start building mobile apps.

---

## Common Setup Problems

| Problem | Fix |
|---------|-----|
| `command not found: dart` | PATH not set — restart terminal, or re-check PATH steps |
| `flutter: command not found` after install | Open a NEW terminal window (PATH loads on start) |
| Windows: works in one terminal, not another | Add PATH to *User variables*, not just one shell |
| Mac M-series: build errors | Install Rosetta (command in Mac section above) |
| Linux snap: `flutter doctor` hangs first run | Normal — it downloads the Dart SDK, wait once |
| VS Code doesn't highlight Dart | Install the Dart extension and reopen the folder |

---

## No-Install Fallback

Zero setup: [DartPad](https://dartpad.dev) runs Dart in the browser. Fine for lessons 01–08. You'll want a real install from lesson 09+ (multiple files, projects).

---

## Flutter Connection

The exact same SDK you installed today builds iOS, Android, web, and desktop apps later. When you reach Flutter, setup is already done — you'll just run `flutter create my_app`.

---

## Next Step

Setup verified? Go to [Lesson 01 — Introduction to Dart](../lesson-01-introduction/).
