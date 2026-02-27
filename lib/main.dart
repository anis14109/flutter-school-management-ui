import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Management'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      endDrawer: const NavigationDrawerWidget(),
      body: const DashboardBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Admin'),
            accountEmail: const Text('admin@school.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Text('A', style: TextStyle(color: Colors.white)),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItem('Students', Icons.school, Colors.blue, const StudentsPage()),
      MenuItem('Teachers', Icons.person, Colors.green, const TeachersPage()),
      MenuItem(
        'Parents',
        Icons.family_restroom,
        Colors.orange,
        const ParentsPage(),
      ),
      MenuItem(
        'Attendance',
        Icons.check_circle,
        Colors.purple,
        const AttendancePage(),
      ),
      MenuItem('Exams', Icons.assignment, Colors.red, const ExamsPage()),
      MenuItem('Results', Icons.grade, Colors.teal, const ResultsPage()),
      MenuItem('Fees', Icons.payment, Colors.indigo, const FeesPage()),
      MenuItem(
        'Library',
        Icons.library_books,
        Colors.brown,
        const LibraryPage(),
      ),
      MenuItem(
        'Transport',
        Icons.directions_bus,
        Colors.amber,
        const TransportPage(),
      ),
      MenuItem(
        'Notice Board',
        Icons.campaign,
        Colors.pink,
        const NoticeBoardPage(),
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, Admin!',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage your school efficiently',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          GridView.count(
            crossAxisCount: _getCrossAxisCount(context),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: menuItems
                .map((item) => _buildMenuCard(context, item))
                .toList(),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 5;
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }

  Widget _buildMenuCard(BuildContext context, MenuItem item) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => item.page),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.color, size: 32),
              ),
              const SizedBox(height: 12),
              Text(
                item.title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final Color color;
  final Widget page;

  MenuItem(this.title, this.icon, this.color, this.page);
}

class PageWithBottomNav extends StatefulWidget {
  final String title;
  final List<BottomNavItem> navItems;
  final List<Widget> pages;
  final int initialIndex;

  const PageWithBottomNav({
    super.key,
    required this.title,
    required this.navItems,
    required this.pages,
    this.initialIndex = 0,
  });

  @override
  State<PageWithBottomNav> createState() => _PageWithBottomNavState();
}

class _PageWithBottomNavState extends State<PageWithBottomNav> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex.clamp(0, widget.pages.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    final validIndex = _selectedIndex.clamp(0, widget.pages.length - 1);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: widget.pages[validIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.navItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return _buildNavItem(
                index,
                item.selectedIcon,
                item.icon,
                item.label,
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData selectedIcon,
    IconData icon,
    String label,
  ) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem {
  final IconData selectedIcon;
  final IconData icon;
  final String label;

  BottomNavItem(this.selectedIcon, this.icon, this.label);
}

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Students',
      navItems: [
        BottomNavItem(Icons.people, Icons.people_outline, 'All Students'),
        BottomNavItem(Icons.person_add, Icons.person_add_outlined, 'Add New'),
        BottomNavItem(Icons.badge, Icons.badge_outlined, 'ID Cards'),
        BottomNavItem(Icons.download, Icons.download_outlined, 'Export'),
        BottomNavItem(Icons.people, Icons.people_outline, 'All Students'),
        BottomNavItem(Icons.person_add, Icons.person_add_outlined, 'Add New'),
        BottomNavItem(Icons.badge, Icons.badge_outlined, 'ID Cards'),
        BottomNavItem(Icons.download, Icons.download_outlined, 'Export'),
        BottomNavItem(Icons.people, Icons.people_outline, 'All Students'),
        BottomNavItem(Icons.person_add, Icons.person_add_outlined, 'Add New'),
        BottomNavItem(Icons.badge, Icons.badge_outlined, 'ID Cards'),
        BottomNavItem(Icons.download, Icons.download_outlined, 'Export'),
      ],
      pages: [
        const AllStudentsView(),
        const AddStudentView(),
        const IdCardsView(),
        const ExportView(),
      ],
    );
  }
}

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Teachers',
      navItems: [
        BottomNavItem(Icons.people, Icons.people_outline, 'All Teachers'),
        BottomNavItem(Icons.person_add, Icons.person_add_outlined, 'Add New'),
        BottomNavItem(Icons.schedule, Icons.schedule_outlined, 'Schedule'),
        BottomNavItem(Icons.school, Icons.school_outlined, 'Subjects'),
      ],
      pages: [
        const AllTeachersView(),
        const AddTeacherView(),
        const TeacherScheduleView(),
        const TeacherSubjectsView(),
      ],
    );
  }
}

class ParentsPage extends StatelessWidget {
  const ParentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Parents',
      navItems: [
        BottomNavItem(Icons.people, Icons.people_outline, 'All Parents'),
        BottomNavItem(Icons.message, Icons.message_outlined, 'Messages'),
        BottomNavItem(Icons.feedback, Icons.feedback_outlined, 'Feedback'),
      ],
      pages: [
        const AllParentsView(),
        const ParentMessagesView(),
        const ParentFeedbackView(),
      ],
    );
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Attendance',
      navItems: [
        BottomNavItem(Icons.check_circle, Icons.check_circle_outline, 'Mark'),
        BottomNavItem(Icons.history, Icons.history_outlined, 'Records'),
        BottomNavItem(Icons.analytics, Icons.analytics_outlined, 'Reports'),
      ],
      pages: [
        const MarkAttendanceView(),
        const AttendanceRecordsView(),
        const AttendanceReportsView(),
      ],
    );
  }
}

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Exams',
      navItems: [
        BottomNavItem(Icons.assignment, Icons.assignment_outlined, 'Schedule'),
        BottomNavItem(Icons.add_circle, Icons.add_circle_outline, 'Create'),
        BottomNavItem(Icons.timer, Icons.timer_outlined, 'Seating'),
      ],
      pages: [
        const ExamScheduleView(),
        const CreateExamView(),
        const SeatingPlanView(),
      ],
    );
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Results',
      navItems: [
        BottomNavItem(Icons.grade, Icons.grade_outlined, 'Publish'),
        BottomNavItem(Icons.analytics, Icons.analytics_outlined, 'Analysis'),
        BottomNavItem(Icons.download, Icons.download_outlined, 'Download'),
      ],
      pages: [
        const PublishResultsView(),
        const ResultAnalysisView(),
        const DownloadResultsView(),
      ],
    );
  }
}

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Fees',
      navItems: [
        BottomNavItem(Icons.payment, Icons.payment_outlined, 'Collect'),
        BottomNavItem(Icons.receipt, Icons.receipt_outlined, 'Records'),
        BottomNavItem(
          Icons.account_balance,
          Icons.account_balance_outlined,
          'Accounts',
        ),
      ],
      pages: [
        const CollectFeesView(),
        const FeesRecordsView(),
        const FeesAccountsView(),
      ],
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Library',
      navItems: [
        BottomNavItem(Icons.book, Icons.book_outlined, 'Books'),
        BottomNavItem(Icons.bookmark, Icons.bookmark_outlined, 'Issue'),
        BottomNavItem(Icons.history, Icons.history_outlined, 'Returns'),
      ],
      pages: [const BooksView(), const IssueBookView(), const ReturnBookView()],
    );
  }
}

class TransportPage extends StatelessWidget {
  const TransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Transport',
      navItems: [
        BottomNavItem(
          Icons.directions_bus,
          Icons.directions_bus_outlined,
          'Routes',
        ),
        BottomNavItem(Icons.person, Icons.person_outlined, 'Drivers'),
        BottomNavItem(Icons.map, Icons.map_outlined, 'Tracking'),
      ],
      pages: [const RoutesView(), const DriversView(), const TrackingView()],
    );
  }
}

class NoticeBoardPage extends StatelessWidget {
  const NoticeBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWithBottomNav(
      title: 'Notice Board',
      navItems: [
        BottomNavItem(Icons.campaign, Icons.campaign_outlined, 'Notices'),
        BottomNavItem(Icons.add_circle, Icons.add_circle_outlined, 'Create'),
        BottomNavItem(Icons.send, Icons.send_outlined, 'Send'),
      ],
      pages: [
        const NoticesView(),
        const CreateNoticeView(),
        const SendNoticeView(),
      ],
    );
  }
}

class AllStudentsView extends StatelessWidget {
  const AllStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('All Students View'));
  }
}

class AddStudentView extends StatelessWidget {
  const AddStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Add Student View'));
  }
}

class IdCardsView extends StatelessWidget {
  const IdCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('ID Cards View'));
  }
}

class ExportView extends StatelessWidget {
  const ExportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Export View'));
  }
}

class AllTeachersView extends StatelessWidget {
  const AllTeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('All Teachers View'));
  }
}

class AddTeacherView extends StatelessWidget {
  const AddTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Add Teacher View'));
  }
}

class TeacherScheduleView extends StatelessWidget {
  const TeacherScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Teacher Schedule View'));
  }
}

class TeacherSubjectsView extends StatelessWidget {
  const TeacherSubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Teacher Subjects View'));
  }
}

class AllParentsView extends StatelessWidget {
  const AllParentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('All Parents View'));
  }
}

class ParentMessagesView extends StatelessWidget {
  const ParentMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Parent Messages View'));
  }
}

class ParentFeedbackView extends StatelessWidget {
  const ParentFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Parent Feedback View'));
  }
}

class MarkAttendanceView extends StatelessWidget {
  const MarkAttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Mark Attendance View'));
  }
}

class AttendanceRecordsView extends StatelessWidget {
  const AttendanceRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Attendance Records View'));
  }
}

class AttendanceReportsView extends StatelessWidget {
  const AttendanceReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Attendance Reports View'));
  }
}

class ExamScheduleView extends StatelessWidget {
  const ExamScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Exam Schedule View'));
  }
}

class CreateExamView extends StatelessWidget {
  const CreateExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Create Exam View'));
  }
}

class SeatingPlanView extends StatelessWidget {
  const SeatingPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Seating Plan View'));
  }
}

class PublishResultsView extends StatelessWidget {
  const PublishResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Publish Results View'));
  }
}

class ResultAnalysisView extends StatelessWidget {
  const ResultAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Result Analysis View'));
  }
}

class DownloadResultsView extends StatelessWidget {
  const DownloadResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Download Results View'));
  }
}

class CollectFeesView extends StatelessWidget {
  const CollectFeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Collect Fees View'));
  }
}

class FeesRecordsView extends StatelessWidget {
  const FeesRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Fees Records View'));
  }
}

class FeesAccountsView extends StatelessWidget {
  const FeesAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Fees Accounts View'));
  }
}

class BooksView extends StatelessWidget {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Books View'));
  }
}

class IssueBookView extends StatelessWidget {
  const IssueBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Issue Book View'));
  }
}

class ReturnBookView extends StatelessWidget {
  const ReturnBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Return Book View'));
  }
}

class RoutesView extends StatelessWidget {
  const RoutesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Routes View'));
  }
}

class DriversView extends StatelessWidget {
  const DriversView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Drivers View'));
  }
}

class TrackingView extends StatelessWidget {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Tracking View'));
  }
}

class NoticesView extends StatelessWidget {
  const NoticesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Notices View'));
  }
}

class CreateNoticeView extends StatelessWidget {
  const CreateNoticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Create Notice View'));
  }
}

class SendNoticeView extends StatelessWidget {
  const SendNoticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Send Notice View'));
  }
}
