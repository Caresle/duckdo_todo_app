import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  const CustomSwitch({super.key, this.value = false});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;

    return Switch(
      thumbColor: WidgetStatePropertyAll(
          value ? AppTheme.thumb(isDark) : AppTheme.thumbDisabled(isDark)),
      trackColor: WidgetStatePropertyAll(
          value ? AppTheme.primary(isDark) : AppTheme.complement(isDark)),
      value: value,
      onChanged: (value) {},
    );
  }
}
