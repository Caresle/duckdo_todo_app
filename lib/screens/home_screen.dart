import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:duckdo_todo/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DuckDo Todo',
          style: TextStyle(color: AppTheme.primary(isDark)),
        ),
        backgroundColor: AppTheme.complement(isDark),
      ),
      backgroundColor: AppTheme.complement(isDark),
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
