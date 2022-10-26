import 'package:rickmorty/theme/colors.dart';

abstract class AppTheme {
  AppColors get colors;
}

class DarkTheme implements AppTheme {
  @override
  AppColors get colors => DarkColors();
}

class LightTheme implements AppTheme {
  @override
  AppColors get colors => LightColors();
}
