import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Teachers',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.people, icon: Icons.people_outline, label: 'All Teachers'),
        BottomNavItem(selectedIcon: Icons.person_add, icon: Icons.person_add_outlined, label: 'Add New'),
        BottomNavItem(selectedIcon: Icons.schedule, icon: Icons.schedule_outlined, label: 'Schedule'),
        BottomNavItem(selectedIcon: Icons.school, icon: Icons.school_outlined, label: 'Subjects'),
      ],
      pages: const [
        AllTeachersView(),
        AddTeacherView(),
        TeacherScheduleView(),
        TeacherSubjectsView(),
      ],
    );
  }
}
