import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DuckDo Todo'),
        backgroundColor: AppTheme.complement,
      ),
      backgroundColor: AppTheme.complement,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: TodoList(),
      )),
      floatingActionButton: AddTodo(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigation(selectedItem: 0),
    );
  }
}
