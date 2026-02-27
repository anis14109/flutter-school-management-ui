import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Results',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.grade, icon: Icons.grade_outlined, label: 'Publish'),
        BottomNavItem(selectedIcon: Icons.analytics, icon: Icons.analytics_outlined, label: 'Analysis'),
        BottomNavItem(selectedIcon: Icons.download, icon: Icons.download_outlined, label: 'Download'),
      ],
      pages: const [
        PublishResultsView(),
        ResultAnalysisView(),
        DownloadResultsView(),
      ],
    );
  }
}
