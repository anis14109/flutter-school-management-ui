import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class TransportPage extends StatelessWidget {
  const TransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Transport',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.directions_bus, icon: Icons.directions_bus_outlined, label: 'Routes'),
        BottomNavItem(selectedIcon: Icons.person, icon: Icons.person_outlined, label: 'Drivers'),
        BottomNavItem(selectedIcon: Icons.map, icon: Icons.map_outlined, label: 'Tracking'),
      ],
      pages: const [
        RoutesView(),
        DriversView(),
        TrackingView(),
      ],
    );
  }
}
