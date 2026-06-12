// ============================================================
//  Lesson 00 — Setup Verification
//  If this file runs, your Dart installation works!
//
//  Run it:  dart run lessons/lesson-00-setup/main.dart
// ============================================================

import 'dart:io'; // gives access to Platform info (OS, version)

void main() {
  // If you can read this output, Dart is installed correctly
  print('✓ Dart is working!');

  // Platform.version contains the Dart SDK version string
  String version = Platform.version.split(' ').first;
  print('✓ Version: $version');

  // Which operating system you are on
  print('✓ Platform: ${Platform.operatingSystem}');

  print('You are ready for Lesson 01!');
}
