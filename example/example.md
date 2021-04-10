# EXAMPLE FOR BAKE

## Example's `pubspec.yaml`

```YAML
name: test
description: A test app for Bake!
version: 1.0.0
publish_to: none
homepage: https://github.com/iamtheblackunicorn/Bake
environment:
  sdk: '>=2.12.0 <3.0.0'
dependencies:
  bake:
    git: git://github.com/iamtheblackunicorn/Bake.git
```

## Example's `main.dart`

```dart
/*
Bake by Alexander Abraham, the Black Unicorn
licensed under the MIT license
*/

/// Imports all functions from
/// the "lib" folder.
import 'package:bake/bake.dart';

/// This is the entry point for the Dart VM.
void main(List<String> arguments) {
  cliApp(arguments);
}
```
