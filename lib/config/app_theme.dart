import 'package:flutter/material.dart';

class AppTheme {
  static final Color _primaryLight = Colors.black;
  static final Color _secondaryLight = Colors.white;
  static final Color _complementLight = Color.fromRGBO(226, 232, 240, 1);
  static final Color _thumbColorLight = Colors.white;
  static final Color _thumbColorDisabledLight = Colors.blueGrey.shade400;

  static final Color _primaryDark = Colors.white;
  static final Color _secondaryDark = Colors.black;
  static final Color _complementDark = Color.fromRGBO(32, 32, 32, 1);
  static final Color _thumbColorDark = Color.fromRGBO(125, 125, 125, 1);
  static final Color _thumbColorDisabledDark = Colors.white;

  static Color primary(bool isDark) => isDark ? _primaryDark : _primaryLight;
  static Color secondary(bool isDark) =>
      isDark ? _secondaryDark : _secondaryLight;
  static Color complement(bool isDark) =>
      isDark ? _complementDark : _complementLight;

  static Color thumb(bool isDark) =>
      isDark ? _thumbColorDark : _thumbColorLight;
  static Color thumbDisabled(bool isDark) =>
      isDark ? _thumbColorDisabledDark : _thumbColorDisabledLight;
}
