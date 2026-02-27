import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Attendance',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.check_circle, icon: Icons.check_circle_outline, label: 'Mark'),
        BottomNavItem(selectedIcon: Icons.history, icon: Icons.history_outlined, label: 'Records'),
        BottomNavItem(selectedIcon: Icons.analytics, icon: Icons.analytics_outlined, label: 'Reports'),
      ],
      pages: const [
        MarkAttendanceView(),
        AttendanceRecordsView(),
        AttendanceReportsView(),
      ],
    );
  }
}
