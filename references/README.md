# References & Cheat Sheets

Quick reference material for the entire Dart language.

## Files

| File | Content |
|------|---------|
| `dart-cheatsheet.md` | All syntax in one page |
| `null-safety-guide.md` | Complete null safety reference |
| `dart-vs-syntax.md` | Syntax comparison |

> Reference files are added as lessons progress.

## Quick Links

- [Dart Language Tour](https://dart.dev/language)
- [Dart API Reference](https://api.dart.dev)
- [DartPad — Online Editor](https://dartpad.dev)
- [Dart Packages](https://pub.dev)
- [Effective Dart Guide](https://dart.dev/guides/language/effective-dart)
- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Widget Catalog](https://flutter.dev/widgets)

## Dart in One Line Per Concept

```dart
var x = 5;                        // inferred type
String s = 'text';                // explicit String
int i = 42;                       // whole number
double d = 3.14;                  // decimal
bool b = true;                    // true/false
dynamic any = 'anything';         // any type
final f = 'set once';             // runtime constant
const c = 3.14;                   // compile-time constant
String? n = null;                 // nullable
late String l; l = 'later';      // deferred assign

print('$x ${x * 2}');            // string interpolation

if (x > 3) {} else {}            // condition
for (var i=0; i<5; i++) {}       // for loop
while (x > 0) { x--; }          // while loop
for (var item in list) {}        // for-in

void fn(int a, {required String b}) {} // function
var result = (int x) => x * 2;  // arrow function

List<int> list = [1,2,3];        // List
Map<String,int> map = {'a': 1};  // Map
Set<int> set = {1,2,3};          // Set

class Person { String name; Person(this.name); }
class Student extends Person { Student(super.name); }

Future<String> load() async { return await fetchData(); }
```
