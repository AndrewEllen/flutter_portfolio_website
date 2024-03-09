
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  late ThemeMode _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  late bool _isScrolled = false;
  bool get isScrolled => _isScrolled;

  void changeScrollState(bool? scrollState) {

    if (scrollState != null) {

      _isScrolled = scrollState;

    } else {

      _isScrolled = !isScrolled;

    }

    notifyListeners();
  }

  void changeThemeMode() {

    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }

   notifyListeners();

  }

}