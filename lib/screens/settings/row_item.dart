import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RowItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const RowItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppTheme.primary(isDark),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(color: AppTheme.primary(isDark)),
            ),
          ],
        ),
        CustomSwitch(value: true),
      ]),
    );
  }
}
