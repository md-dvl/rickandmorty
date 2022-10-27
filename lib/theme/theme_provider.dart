import 'package:flutter/material.dart';
import 'package:rickmorty/service_locator.dart';
import 'package:rickmorty/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        sl<SharedPreferences>().setString(
          'theme',
          ThemeMode.dark.name,
        );
        break;
      default:
        colors = lightColors;
        sl<SharedPreferences>().setString(
          'theme',
          ThemeMode.light.name,
        );
    }
    notifyListeners();
  }

  initialize() {
    final oldTheme = sl<SharedPreferences>().getString('theme');
    if (oldTheme == ThemeModes.dark.name) {
      colors = darkColors;
    } else {
      colors = lightColors;
    }

    notifyListeners();
  }
}
