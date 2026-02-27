import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class BottomNavItem {
  final IconData selectedIcon;
  final IconData icon;
  final String label;

  const BottomNavItem({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });
}
