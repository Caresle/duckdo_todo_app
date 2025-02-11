import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:duckdo_todo/screens/settings/row_item.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;

    return Scaffold(
      backgroundColor: AppTheme.complement(isDark),
      appBar: AppBar(
        backgroundColor: AppTheme.complement(isDark),
        title: Text('Settings',
            style: TextStyle(
              color: AppTheme.primary(isDark),
            )),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RowItem(
              icon: Icons.wb_sunny_rounded,
              text: 'Dark Theme',
              value: isDark,
              onChanged: (value) {
                final themeProvider = context.read<ThemeProvider>();
                themeProvider.toggleTheme();
              },
            ),
            RowItem(icon: Icons.notifications_rounded, text: 'Reminders'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedItem: 1),
    );
  }
}
