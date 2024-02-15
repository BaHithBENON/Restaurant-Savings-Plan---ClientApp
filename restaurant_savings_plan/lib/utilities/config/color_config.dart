// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class ColorConfig {
  static const Color starColor = Color.fromARGB(255, 255, 55, 0);

  static const Color primary = Color(0xD73B53);

  static const Color primaryColor = Color(0xFF003399);
  static const Color primaryColorSecondV = Color.fromARGB(255, 187, 73, 248);
  static const Color primaryColorThirdV = Color.fromARGB(255, 73, 17, 103);

  static const Color secondaryColor = Color(0xFFFCAF17);
  static const Color secondaryColorSecondV = Color.fromARGB(255, 240, 73, 78);

  static const Color darkColor = Color(0xFF000A1E);
  static const Color neutralColor = Color(0xFF666C78);
  static const Color lightColor = Color(0xFFDEDFE2);

  static Color getInputColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Color.fromARGB(255, 56, 55, 55);
    } else {
      return Color.fromARGB(255, 245, 245, 245);
    }
  }

  static Color getTextColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  static Color getTextColorInverse(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  static Gradient boxGradient(BuildContext context) {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorConfig.primaryColor,
        ColorConfig.primaryColorSecondV,
        ColorConfig.secondaryColor,
      ],
    );
  }
}
