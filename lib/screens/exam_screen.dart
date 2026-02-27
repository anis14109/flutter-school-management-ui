import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Exams',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.assignment, icon: Icons.assignment_outlined, label: 'Schedule'),
        BottomNavItem(selectedIcon: Icons.add_circle, icon: Icons.add_circle_outline, label: 'Create'),
        BottomNavItem(selectedIcon: Icons.timer, icon: Icons.timer_outlined, label: 'Seating'),
      ],
      pages: const [
        ExamScheduleView(),
        CreateExamView(),
        SeatingPlanView(),
      ],
    );
  }
}
