import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes {
  static final lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
          primary: ModeColors.purple1,
          onPrimary: Colors.black,
          secondary: ModeColors.purple,
          onSecondary: Colors.black,
          background: ModeColors.purple1));

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(
    primary: ModeColors.spaceCadet,
    secondary: Colors.white,
    onSecondary: ModeColors.darkGrey,
    background: ModeColors.spaceCadet,
  ));
}
