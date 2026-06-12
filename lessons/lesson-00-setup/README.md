# Lesson 00 — Local Setup: Dart & Flutter

Complete installation guide, organized per operating system.
Jump to your OS: [Mac](#-mac-setup) · [Windows](#-windows-setup) · [Linux](#-linux-setup)

---

## Before You Start — One Key Fact

**The Flutter SDK includes the full Dart SDK.** Install Flutter once → you get both `flutter` and `dart` commands. Since your goal is Flutter, installing Flutter directly is the smart path.

```
Install Flutter  ──────►  Dart included automatically ✓
```

Each OS section below shows every method — pick ONE.

---

# 🍎 Mac Setup

## Method 1 — Homebrew (Easiest, Recommended)

Homebrew is Mac's package manager — installs and updates everything with one command.

### Step 1: Install Homebrew (skip if you have it)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Check it worked:
```bash
brew --version
```

### Step 2: Install Flutter (Dart included)
```bash
brew install --cask flutter
```

### Step 3: Apple Silicon only (M1/M2/M3/M4)
```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

### Step 4: Verify
```bash
flutter --version
dart --version
```

> **Updating later:** `brew upgrade --cask flutter` — that's the whole reason Homebrew is the best method.

### Dart-only via Homebrew (if you really don't want Flutter yet)
```bash
brew tap dart-lang/dart
brew install dart
```

---

## Method 2 — Manual Download (no Homebrew)

### Step 1: Download
Go to [https://docs.flutter.dev/get-started/install/macos](https://docs.flutter.dev/get-started/install/macos) and download the zip for your chip:
- **Apple Silicon** (M1/M2/M3/M4) → arm64 zip
- **Intel Mac** → x64 zip

Not sure which chip?  → Apple menu → About This Mac.

### Step 2: Extract to a dev folder
```bash
mkdir -p ~/development
cd ~/development
unzip ~/Downloads/flutter_macos_*.zip
```

### Step 3: Add Flutter to PATH permanently
```bash
# Mac uses zsh by default
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### Step 4: Verify
```bash
flutter --version
dart --version
```

---

## Method 3 — VS Code Extension Installer (newest, zero terminal)

1. Install [VS Code](https://code.visualstudio.com/)
2. Install the **Flutter** extension
3. Open Command Palette (`Cmd+Shift+P`) → type **"Flutter: New Project"**
4. VS Code detects no SDK → click **"Download SDK"**
5. Pick a folder (e.g. `~/development`) — VS Code downloads and configures everything

Best for: total beginners who fear the terminal.

---

# 🪟 Windows Setup

## Method 1 — Manual Download + PATH (Most Reliable, Recommended)

### Step 1: Download
Go to [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows) → download the Flutter SDK zip.

### Step 2: Extract to the right place
Extract to:
```
C:\dev\flutter
```
⚠️ **NEVER** extract to `C:\Program Files\` — permission errors guaranteed.
⚠️ Avoid paths with spaces or special characters.

### Step 3: Add Flutter to PATH (detailed)
1. Press `Win` key → type **"env"** → open **"Edit the system environment variables"**
2. Click **"Environment Variables..."** button
3. In the TOP box (*User variables*), select **Path** → click **Edit**
4. Click **New** → type:
   ```
   C:\dev\flutter\bin
   ```
5. Click **OK** → **OK** → **OK** (all three windows)

### Step 4: Verify
Open a **NEW** PowerShell window (old ones don't see the new PATH):
```powershell
flutter --version
dart --version
```

---

## Method 2 — winget (One Command, Windows 10/11)

winget is Windows' built-in package manager.

```powershell
# Dart only — quick start for the Dart lessons
winget install -e --id=Google.DartSDK
```

```powershell
# Or Flutter (community package)
winget install -e --id=Flutter.Flutter
```

Verify in a new terminal:
```powershell
dart --version
```

---

## Method 3 — VS Code Extension Installer

1. Install [VS Code](https://code.visualstudio.com/)
2. Install the **Flutter** extension
3. `Ctrl+Shift+P` → **"Flutter: New Project"** → **"Download SDK"**
4. Choose folder like `C:\dev` — VS Code handles download + PATH

---

# 🐧 Linux Setup

## Method 1 — snap (Easiest, Ubuntu/Debian, Recommended)

```bash
sudo snap install flutter --classic
```

First run initializes the SDK (downloads Dart — takes a minute, only once):
```bash
flutter --version
dart --version
```

> snap auto-updates Flutter in the background — zero maintenance.

---

## Method 2 — Manual Download + PATH

### Step 1: Download and extract
```bash
cd ~
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_stable.tar.xz
mkdir -p ~/development
tar xf flutter_linux_stable.tar.xz -C ~/development
```

### Step 2: Add to PATH permanently
```bash
# bash (default on most distros)
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# using zsh instead? use ~/.zshrc
```

### Step 3: Install required system libraries
```bash
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
```

### Step 4: Verify
```bash
flutter --version
dart --version
```

---

## Method 3 — apt (Dart only, no Flutter)

```bash
sudo apt-get update
sudo apt-get install apt-transport-https
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update
sudo apt-get install dart
dart --version
```

---

# 🛠 VS Code Setup (All Platforms)

1. Install [VS Code](https://code.visualstudio.com/)
2. Open Extensions: `Cmd+Shift+X` (Mac) / `Ctrl+Shift+X` (Windows/Linux)
3. Install these two:

| Extension | Publisher | Why |
|-----------|-----------|-----|
| **Dart** | Dart Code | autocomplete, errors while typing, hover docs |
| **Flutter** | Dart Code | needed later for Flutter apps |

4. Restart VS Code, open this repo folder

You now get a **Run** button above every `main()` function.

---

# ✅ Verify Your Setup

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

Installed Flutter? Also run:
```bash
flutter doctor
```
For Dart lessons you only need the **Flutter ✓** line. Ignore Android/Xcode warnings until you build mobile apps.

---

# 🚑 Common Problems & Fixes

| Problem | OS | Fix |
|---------|-----|-----|
| `command not found: dart` | All | Open a NEW terminal — PATH loads at startup |
| `flutter: command not found` | All | Same — new terminal; then re-check PATH steps |
| Works in one terminal, not another | Windows | PATH must be in *User variables*, not session-only |
| Build errors on M-series Mac | Mac | Install Rosetta: `sudo softwareupdate --install-rosetta --agree-to-license` |
| `flutter doctor` hangs first run | Linux snap | Normal — downloading Dart SDK, wait once |
| Permission denied during install | Windows | Don't use `C:\Program Files` — use `C:\dev\flutter` |
| VS Code doesn't recognize Dart | All | Install Dart extension → reopen the folder |
| brew command slow/fails | Mac | Run `brew update` first, retry |

---

# 🌐 No-Install Fallback

Zero setup needed: [DartPad](https://dartpad.dev) runs Dart in your browser.
Fine for lessons 01–08. Install locally from lesson 09+ (multi-file projects need it).

---

# Next Step

Setup verified? → [Lesson 01 — Introduction to Dart](../lesson-01-introduction/)
