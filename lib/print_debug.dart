library print_debug;

import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

List<PrintType> _listSee = [];
bool _showInReleaseMode = false;
bool _showIcons = true;

enum PrintType { DEBUG, ERROR, WARNING, SUCCESS, LOG }

class PrintDebug {
  static init({
    List<PrintType>? visiblePrints,
    bool showInReleaseMode = false,
    bool showIcons = true,
  }) {
    _listSee = visiblePrints ??= [
      PrintType.DEBUG,
      PrintType.ERROR,
      PrintType.WARNING,
      PrintType.SUCCESS,
      PrintType.LOG,
    ];
    _showInReleaseMode = showInReleaseMode;
    _showIcons = showIcons;
  }
}

void printDebug(
  dynamic value, {
  dynamic error,
  PrintType? printType,
  String textColor = '',
  String backgroundColor = '',
}) {
  if (_showInReleaseMode || !kReleaseMode) {
    if (_listSee.length == 0 || printType == null) {
      _printLog(value, error: error, printType: printType, textColor: textColor, backgroundColor: backgroundColor);
    } else if (_listSee.contains(printType)) {
      _printLog(value, error: error, printType: printType, textColor: textColor, backgroundColor: backgroundColor);
    }
  }
}

void _printLog(
  dynamic value, {
  dynamic error,
  PrintType? printType,
  String textColor = '',
  String backgroundColor = '',
}) {
  String _icon = "";
  switch (printType) {
    case PrintType.DEBUG:
      if (Platform.isIOS) {
        _icon = "🔧";
      } else {
        _icon += "\u001b[0m${TextColor.cyan}🔧\u001b[0m";
      }
      break;
    case PrintType.ERROR:
      if (Platform.isIOS) {
        _icon = "❌";
      } else {
        _icon = "\u001b[0m${TextColor.red}❌\u001b[0m";
      }
      break;
    case PrintType.WARNING:
      if (Platform.isIOS) {
        _icon = "⚠";
      } else {
        _icon = "\u001b[0m${TextColor.yellow}⚠\u001b[0m";
      }
      break;
    case PrintType.SUCCESS:
      if (Platform.isIOS) {
        _icon = "✔";
      } else {
        _icon = "\u001b[0m${TextColor.green}✔\u001b[0m";
      }
      break;
    case PrintType.LOG:
      if (Platform.isIOS) {
        _icon = "📌";
      } else {
        _icon = "\u001b[0m${TextColor.blue}📌\u001b[0m";
      }
      break;
    default:
      if (Platform.isIOS) {
        _icon = "🔔";
      } else {
        _icon = '\u001b[0m${TextColor.yellow}🔔\u001b[0m';
      }
  }
  if (Platform.isIOS) {
    print((_showIcons ? _icon : "") + ' $value');
  } else {
    print((_showIcons ? _icon : "") + '  \u001b[0m$backgroundColor$textColor$value\u001b[0m');
  }

  if (error != null) {
    log(value, error: error, name: "ERROR");
  }
}

//class TextColor Only Windows
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

///class BackgroundColor Only Windows
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
