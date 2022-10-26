import 'package:flutter/material.dart';
import 'package:rickmorty/theme/colors.dart';

enum ThemeModes { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    initialize();
  }
  final darkColors = DarkColors();
  final lightColors = LightColors();

  late AppColors colors;

  void changeTheme(ThemeModes mode) {
    switch (mode) {
      case ThemeModes.dark:
        colors = darkColors;
        break;
      default:
        colors = lightColors;
    }
    notifyListeners();
  }

  initialize() {
    colors = lightColors;

    notifyListeners();
  }
}
