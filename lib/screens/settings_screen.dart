import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/screens/settings/row_item.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.complement,
      appBar: AppBar(
        backgroundColor: AppTheme.complement,
        title: Text('Settings'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RowItem(icon: Icons.wb_sunny_rounded, text: 'Dark Theme'),
            RowItem(icon: Icons.notifications_rounded, text: 'Reminders'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedItem: 1),
    );
  }
}
