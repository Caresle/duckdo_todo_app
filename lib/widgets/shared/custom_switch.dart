import 'package:duckdo_todo/config/app_theme.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  const CustomSwitch({super.key, this.value = false});

  @override
  Widget build(BuildContext context) {
    return Switch(
      trackColor: WidgetStatePropertyAll(
          value ? AppTheme.primary : Color.fromRGBO(226, 232, 240, 1)),
      value: value,
      onChanged: (value) {},
    );
  }
}
