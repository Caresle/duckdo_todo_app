import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(226, 232, 240, 1),
      body: Center(
        child: Text('welcome to settings'),
      ),
      bottomNavigationBar: BottomNavigation(selectedItem: 1),
    );
  }
}
