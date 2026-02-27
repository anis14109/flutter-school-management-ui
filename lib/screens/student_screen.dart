import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Students',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.people, icon: Icons.people_outline, label: 'All Students'),
        BottomNavItem(selectedIcon: Icons.person_add, icon: Icons.person_add_outlined, label: 'Add New'),
        BottomNavItem(selectedIcon: Icons.badge, icon: Icons.badge_outlined, label: 'ID Cards'),
        BottomNavItem(selectedIcon: Icons.download, icon: Icons.download_outlined, label: 'Export'),
      ],
      pages: const [
        AllStudentsView(),
        AddStudentView(),
        IdCardsView(),
        ExportView(),
      ],
    );
  }
}
