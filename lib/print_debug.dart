library print_debug;

import 'dart:developer';

import 'package:flutter/foundation.dart';

List<String> _listSee = [];
bool _showInReleaseMode = false;

void init({List<String>? visiblePrints, bool showInReleaseMode = false}) {
  _listSee = visiblePrints ??= [
    "DEBUG",
    "ERROR",
  ];
  _showInReleaseMode = showInReleaseMode;
}

void printDebug(dynamic value, {dynamic error, String? logType, String textColor = '', String backgroundColor = ''}) {
  if (_showInReleaseMode || !kReleaseMode) {
    if (_listSee.length == 0) {
      _printLog(value, error: error, logType: logType, textColor: textColor, backgroundColor: backgroundColor);
    } else if (_listSee.contains(logType)) {
      _printLog(value, error: error, logType: logType, textColor: textColor, backgroundColor: backgroundColor);
    }
  }
}

void _printLog(dynamic value, {dynamic error, String? logType, String textColor = '', String backgroundColor = ''}){
  print((error == null ? "\u001b[0m${TextColor.green}✔\u001b[0m " : "\u001b[0m${TextColor.red}❌\u001b[0m ") +
      '\u001b[0m$backgroundColor$textColor$value\u001b[0m');
  if (error != null) {
    log(
      "===============START ERROR=================",
      error: error,
      name: logType ?? "DEBUG",
    );
    log(
      "===============END   ERROR===================",
      name: logType ?? "DEBUG",
    );
  }
}

//class TextColor
class TextColor {
  ///textColor balck unicode
  static final String black = '\u001B[30m';

  ///textColor red unicode
  static final String red = '\u001B[31m';

  ///textColor green unicode
  static final String green = '\u001b[32m';

  ///textColor yellow unicode
  static final String yellow = '\u001b[33m';

  ///textColor blue unicode
  static final String blue = '\u001b[34m';

  ///textColor cyan unicode
  static final String cyan = '\u001b[36m';

  ///textColor white unicode
  static final String white = '\u001b[37m';

  ///textColor orange unicode
  static final String orange = '\u001b[38;5;202m';
}

///class BackgroundColor
class BackGroundColor {
  ///backgroundClor black unicode
  static final String black = "\u001B[40m";

  ///backgroundClor red unicode
  static final String red = "\u001B[41m";

  ///backgroundClor green unicode
  static final String green = "\u001B[42m";

  ///backgroundClor yellow unicode
  static final String yellow = "\u001B[43m";

  ///backgroundClor blue unicode
  static final String blue = "\u001B[44m";

  ///backgroundClor purple unicode
  static final String purple = "\u001B[45m";

  ///backgroundClor cyan unicode
  static final String cyan = "\u001B[46m";

  ///backgroundClor white unicode
  static final String white = "\u001B[47m";
}
