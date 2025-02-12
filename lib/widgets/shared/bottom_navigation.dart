import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/config/router/menu_item.dart';
import 'package:duckdo_todo/config/router/router.dart';
import 'package:duckdo_todo/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedItem;

  const BottomNavigation({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    final isDark = context.read<ThemeProvider>().isDark;

    return Theme(
      data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStatePropertyAll(
                  TextStyle(color: AppTheme.primary(isDark))))),
      child: NavigationBar(
        backgroundColor: AppTheme.secondary(isDark),
        elevation: 1,
        surfaceTintColor: AppTheme.secondary(isDark),
        indicatorColor: AppTheme.primary(isDark),
        selectedIndex: selectedItem,
        onDestinationSelected: (value) {
          if (value == 0) {
            context.go('/');
          }
          if (value == 1) {
            context.go('/settings');
          }
        },
        destinations: [
          ...bottomRoutes.asMap().entries.map((entry) {
            if (selectedItem == entry.key) {
              return NavigationDestination(
                icon: Icon(
                  entry.value.icon,
                  color: AppTheme.secondary(isDark),
                ),
                label: entry.value.name,
              );
            }

            return NavigationDestination(
              icon: Icon(
                entry.value.icon,
                color: AppTheme.primary(isDark),
              ),
              label: entry.value.name,
            );
          })
        ],
      ),
    );
  }
}
