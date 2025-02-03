import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryLight = Colors.black;
  static Color secondaryLight = Colors.white;
  static Color complementLight = Color.fromRGBO(226, 232, 240, 1);
  static Color thumbColorLight = Colors.white;
  static Color thumbColorDisabledLight = Colors.blueGrey.shade400;

  static Color primaryDark = Colors.white;
  static Color secondaryDark = Colors.black;
  static Color complementDark = Color.fromRGBO(32, 32, 32, 1);
  static Color thumbColorDark = Color.fromRGBO(125, 125, 125, 1);
  static Color thumbColorDisabledDark = Colors.white;

  static Color primary(bool isDark) => isDark ? primaryDark : primaryLight;
  static Color secondary(bool isDark) =>
      isDark ? secondaryDark : secondaryLight;
  static Color complement(bool isDark) =>
      isDark ? complementDark : complementLight;

  static Color thumb(bool isDark) => isDark ? thumbColorDark : thumbColorLight;
  static Color thumbDisabled(bool isDark) =>
      isDark ? thumbColorDisabledDark : thumbColorDisabledLight;
}
