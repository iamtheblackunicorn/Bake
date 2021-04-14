# BAKE :baguette_bread:

[![Build Status](https://travis-ci.com/iamtheblackunicorn/Bake.svg?branch=main)](https://travis-ci.com/iamtheblackunicorn/Bake)

*Build your projects with simple rules across platforms.* :baguette_bread:

## About :books:

I think that Makefile is a very useful project because it allows users to implement a simple way to define rules for building their projects across platforms. Bake is like Make but takes a simpler approach and is a Dart project! ;)

## Using the library :pick:

### Installation

#### From Pub.dev

Add the library to your `pubspec.yaml` by adding this to it:

```YAML
dependencies:
  ...
  bake: ^2.0.0
```

#### From GitHub

Add the library to your `pubspec.yaml` by adding this to it:

```YAML
dependencies:
  bake:
    git: git://github.com/iamtheblackunicorn/Bake.git
```

### Importing the API

Import the API like this:

```dart
import 'package:bake/bake.dart';
```

## Building :hammer_and_pick:

### Prerequisites
Make sure you have the following programmes installed:

- GNU Make
- Git
- Dart SDK

### Build it!

- 1.) Get the latest source code:

```bash
$ git clone https://github.com/iamtheblackunicorn/Bake.git
```

- 2.) Change into the source directory's root:

```bash
$ cd Bake
```

- 3.) Compile an executable:

```bash
$ make build
```

This should produce a binary file by the name of `bake` in a sub-directory called `dist`.

## Installation :inbox_tray:

### Linux & Mac OSX

Add this line to your `.zshrc`, `.bashrc` or `.bash_profile` in `$HOME`:

```bash
export PATH="$HOME/blackunicorn/bin:$PATH"
```
After having done that, create a directory called `blackunicorn` in `$HOME` and in `blackunicorn` a directory called `bin`.

### Windows

Go to your "System Settings", go to "This PC" or "My PC" and right-click that entry. Then go to "Edit Environment Variables".
Add this line to the dialog that appears:

```
C:\blackunicorn\bin
```

Save that and quit the "System Settings". After having done that, go to the File Explorer and create a directory called `blackunicorn` in `C:\` and in `blackunicorn` a directory called `bin`.

### Finally

After you have configured the `$PATH`on your system, move the `bake` executable to `blackunicorn/bin`. You may need to run `chmod a+x` on the binary executable before being able to call it from the console.


## Tutorial :pick:

Here's how you get started with Bake!

- 1.) Create a file called `Bakefile`:

```bash
$ touch Bakefile
```

- 2.) Open this file in your favourite editor and add this line to the file:

```bash
'greet' => 'echo Hello World!'
```

- 3.) Run the command `bake` or `bake greet` in the directory where you just created the file:

```bash
Hello World! # This should be the output!
```

## Usage :hammer:

Bake accepts the following options:

Run the first rule of any `Bakefile`:

```bash
$ bake
```

Call a specific rule:

```bash
$ bake my_rule
```

Get version info:

```bash
$ bake --version
```

Get help info:

```bash
$ bake --help
```
## Changelog :scroll:

Please click [here](CHANGELOG.md).

## Note :scroll:

- *Bake :baguette_bread:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
