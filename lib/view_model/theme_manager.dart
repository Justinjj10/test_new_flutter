// Flutter imports:
import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;

  ThemeMode get theme => _theme;

  set theme(ThemeMode newTheme) {
    _theme = newTheme;
    notifyListeners();
  }
}
