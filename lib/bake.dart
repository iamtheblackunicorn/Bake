/*
Bake by Alexander Abraham, the Black Unicorn
licensed under the MIT license
*/

import 'dart:io';
import 'package:termstyle/termstyle.dart';
import 'package:clibu/clibu.dart';

/// Defines which filenames are permitted.
String ruleFile = 'Bakefile';

/// Displays versioning information.
void versionInfo() {
  String unicornHead = getEmoji('unicornHead');
  String blackHeart = getEmoji('blackHeart');
  String color = 'green';
  String lineOne = 'Bake v.1.0.0';
  String lineTwo =
      'by Alexander Abraham $blackHeart, the Black Unicorn $unicornHead';
  String lineThree = 'licensed under the MIT license';
  printColoredString('\n$lineOne\n$lineTwo\n$lineThree\n', '$color');
}

/// Displays help information.
void helpInfo() {
  String bakeHelp = 'bake             executes the first rule of a $ruleFile';
  String initHelp =
      'bake init        creates a $ruleFile with pre-defined rules';
  String ruleHelp = 'bake <yourRule>  executes the rule of the given name';
  String versionHelp = 'bake --version   displays version info';
  String helpHelp = 'bake --help      displays this help message';
  String color = 'cyan';
  printColoredString(
      '\n$bakeHelp\n$initHelp\n$ruleHelp\n$versionHelp\n$helpHelp\n', '$color');
}

/// Checks whether a file exists or not.
bool fileExists(String filePath) {
  bool result = false;
  try {
    File(filePath).readAsStringSync();
    result = true;
  } catch (e) {
    printColoredString('File does not exist!', 'red');
  }
  return result;
}

/// Holds all the grammar patterns of Bake.
Map<String, RegExp> patterns() {
  Map<String, RegExp> patterns = {
    'RULE': RegExp(r"'(.*)'\s=>\s'(.*)'"),
    'COMMENT': RegExp(r'(\/\/.*)')
  };
  return patterns;
}

/// Returns a list of all the matched tokens from a "Bakefile".
List<String> getMatches(String arguments) {
  List<String> result = [];
  for (int i = 0; i < patterns().length; i++) {
    String key = patterns().keys.elementAt(i);
    RegExp pattern = patterns()[key] as RegExp;
    assert(pattern is RegExp);
    if (pattern.hasMatch(arguments) == true) {
      if (key == 'COMMENT') {
      } else if (arguments == '\n') {
      } else {
        Iterable<Match> matches = pattern.allMatches(arguments);
        assert(matches is Iterable<Match>);
        Match myMatch = matches.elementAt(0);
        String firstArg = myMatch.group(1) as String;
        assert(firstArg is String);
        String secondArg = myMatch.group(2) as String;
        assert(secondArg is String);
        result.add(firstArg);
        result.add(secondArg);
      }
    } else {}
  }
  return result;
}

// This method asserts whether a rule exists in a Bakefile!
bool ruleExists(String fileContents, String rule) {
  bool result = false;
  List<String> fileC = fileContents.split('\n');
  for (int i = 0; i < fileC.length; i++) {
    String line = fileC[i];
    List<String> ruleTup = getMatches(line);
    if (ruleTup.length == 2) {
      if (ruleTup[0] == rule) {
        result = true;
      } else {}
    } else {}
  }
  return result;
}

/// Only executes the first rule of a "Bakefile".
void execFirstRule(String fileContents) {
  List<String> fileC = fileContents.split('\n');
  for (int i = 0; i < fileC.length; i++) {
    if (i == 0) {
      String args = fileC[i];
      List<String> ruleTup = getMatches(args);
      if (ruleTup.length == 2) {
        try {
          runCommand(ruleTup[1]);
        } on ProcessException catch (e) {
          printColoredString('$e', 'red');
        }
      } else {}
    } else {}
  }
}

/// Executes any rule of a "Bakefile".
/// Which rule is executed is determined by
/// the second parameter.
void execRule(String fileContents, String rule) {
  List<String> fileC = fileContents.split('\n');
  for (int i = 0; i < fileC.length; i++) {
    String args = fileC[i];
    List<String> ruleTup = getMatches(args);
    if (ruleTup.length == 2) {
      String ruleName = ruleTup[0];
      String ruleCommand = ruleTup[1];
      if (ruleExists(fileContents, rule) == true) {
        if (ruleName == rule) {
          try {
            runCommand(ruleCommand);
          } on ProcessException catch (e) {
            printColoredString('$e', 'red');
          }
        } else {}
      } else {
        printColoredString('Rule "$rule" not found!', 'red');
        break;
      }
    } else {}
  }
}

/// This method creates a standard Bakefile.
void initBakery() {
  List<String> lines = [
    '// A standard build rule, customize this!',
    "'build' => 'echo My project!'",
    '// A standard testing rule, customize this!',
    "'test' => 'echo I am there for testing.'"
  ];
  String fileContents = lines.join('\n');
  try {
    printColoredString('Scaffolding "$ruleFile"...', 'cyan');
    File(ruleFile).writeAsStringSync(fileContents);
  } catch (e) {
    printColoredString('$e', 'red');
  }
}

/// Returns the contents of a file as a string.
String getFileContens() {
  String result = '';
  if (fileExists(ruleFile) == true) {
    result = File(ruleFile).readAsStringSync();
  } else {
    printColoredString('No "$ruleFile" found!', 'red');
  }
  return result;
}

/// This method is the main command-line
/// interface of Bake.
void cliApp(List<String> arguments) {
  int argLength = arguments.length;
  if (argLength == 0) {
    String fileContents = getFileContens();
    execFirstRule(fileContents);
  } else if (argLength == 1) {
    if (arguments[0] == '--version') {
      versionInfo();
    } else if (arguments[0] == '--help') {
      helpInfo();
    } else if (arguments[0] == 'init') {
      initBakery();
    } else {
      try {
        String fileContents = getFileContens();
        execRule(fileContents, arguments[0]);
      } catch (e) {
        printColoredString('$e', 'red');
      }
    }
  } else {
    printColoredString('No valid options provided!', 'red');
  }
}
