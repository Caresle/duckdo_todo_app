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
      drawer: Drawer(
        backgroundColor: AppTheme.secondary(isDark),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppTheme.complement(isDark)),
              child: Text(
                'DuckDo Todo App',
                style: TextStyle(
                  color: AppTheme.primary(isDark),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list_rounded),
              onTap: () {},
              title: Text('List'),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              onTap: () {},
              title: Text('Logout'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'DuckDo Todo',
          style: TextStyle(color: AppTheme.primary(isDark)),
        ),
        backgroundColor: AppTheme.complement(isDark),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu_rounded,
                  color: AppTheme.primary(isDark),
                ));
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon(
              style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: () {},
              icon: Icon(Icons.add_rounded),
              label: Text('New List'),
            ),
          )
        ],
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
