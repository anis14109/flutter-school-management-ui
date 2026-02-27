import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Fees',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.payment, icon: Icons.payment_outlined, label: 'Collect'),
        BottomNavItem(selectedIcon: Icons.receipt, icon: Icons.receipt_outlined, label: 'Records'),
        BottomNavItem(selectedIcon: Icons.account_balance, icon: Icons.account_balance_outlined, label: 'Accounts'),
      ],
      pages: const [
        CollectFeesView(),
        FeesRecordsView(),
        FeesAccountsView(),
      ],
    );
  }
}
