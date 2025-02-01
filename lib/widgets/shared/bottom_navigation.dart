import 'package:duckdo_todo/config/app_theme.dart';
import 'package:duckdo_todo/config/router/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedItem;

  const BottomNavigation({super.key, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: AppTheme.secondary,
      elevation: 1,
      surfaceTintColor: AppTheme.secondary,
      indicatorColor: AppTheme.primary,
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
        ...appMenuItems.asMap().entries.map((entry) {
          if (selectedItem == entry.key) {
            return NavigationDestination(
                icon: Icon(
                  entry.value.icon,
                  color: AppTheme.secondary,
                ),
                label: entry.value.name);
          }

          return NavigationDestination(
            icon: Icon(entry.value.icon),
            label: entry.value.name,
          );
        })
      ],
    );
  }
}
