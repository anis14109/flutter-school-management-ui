import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class NoticeBoardPage extends StatelessWidget {
  const NoticeBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Notice Board',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.campaign, icon: Icons.campaign_outlined, label: 'Notices'),
        BottomNavItem(selectedIcon: Icons.add_circle, icon: Icons.add_circle_outlined, label: 'Create'),
        BottomNavItem(selectedIcon: Icons.send, icon: Icons.send_outlined, label: 'Send'),
      ],
      pages: const [
        NoticesView(),
        CreateNoticeView(),
        SendNoticeView(),
      ],
    );
  }
}
