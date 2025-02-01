import 'package:duckdo_todo/screens/settings/row_item.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 232, 240, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(226, 232, 240, 1),
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
