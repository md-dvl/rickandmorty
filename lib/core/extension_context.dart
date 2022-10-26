import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickmorty/theme/colors.dart';

import '../theme/theme_provider.dart';

extension ExtensionOnContext on BuildContext {
  AppColors get colors => Provider.of<ThemeProvider>(this).colors;
}
