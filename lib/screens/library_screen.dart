import 'package:flutter/material.dart';
import '../models/models.dart';
import 'page_with_bottom_nav.dart';
import '../views/views.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Library',
      navItems: const [
        BottomNavItem(selectedIcon: Icons.book, icon: Icons.book_outlined, label: 'Books'),
        BottomNavItem(selectedIcon: Icons.bookmark, icon: Icons.bookmark_outlined, label: 'Issue'),
        BottomNavItem(selectedIcon: Icons.history, icon: Icons.history_outlined, label: 'Returns'),
      ],
      pages: const [
        BooksView(),
        IssueBookView(),
        ReturnBookView(),
      ],
    );
  }
}
