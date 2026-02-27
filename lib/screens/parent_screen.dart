import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class ParentsPage extends StatelessWidget {
  const ParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Parents',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.people, icon: Icons.people_outline, label: 'All Parents'),
        BottomNavItem(selectedIcon: Icons.message, icon: Icons.message_outlined, label: 'Messages'),
        BottomNavItem(selectedIcon: Icons.feedback, icon: Icons.feedback_outlined, label: 'Feedback'),
      ],
      pages: const [
        AllParentsView(),
        ParentMessagesView(),
        ParentFeedbackView(),
      ],
    );
  }
}
