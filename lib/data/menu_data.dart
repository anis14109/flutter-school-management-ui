import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/student_screen.dart';
import '../screens/teacher_screen.dart';
import '../screens/parent_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/exam_screen.dart';
import '../screens/result_screen.dart';
import '../screens/fee_screen.dart';
import '../screens/library_screen.dart';
import '../screens/transport_screen.dart';
import '../screens/notice_board_screen.dart';

final List<MenuItem> menuItems = [
  MenuItem(
    title: 'Students',
    icon: Icons.school,
    color: Colors.blue,
    page: const StudentsPage(),
  ),
  MenuItem(
    title: 'Teachers',
    icon: Icons.person,
    color: Colors.green,
    page: const TeachersPage(),
  ),
  MenuItem(
    title: 'Parents',
    icon: Icons.family_restroom,
    color: Colors.orange,
    page: const ParentsPage(),
  ),
  MenuItem(
    title: 'Attendance',
    icon: Icons.check_circle,
    color: Colors.purple,
    page: const AttendancePage(),
  ),
  MenuItem(
    title: 'Exams',
    icon: Icons.assignment,
    color: Colors.red,
    page: const ExamsPage(),
  ),
  MenuItem(
    title: 'Results',
    icon: Icons.grade,
    color: Colors.teal,
    page: const ResultsPage(),
  ),
  MenuItem(
    title: 'Fees',
    icon: Icons.payment,
    color: Colors.indigo,
    page: const FeesPage(),
  ),
  MenuItem(
    title: 'Library',
    icon: Icons.library_books,
    color: Colors.brown,
    page: const LibraryPage(),
  ),
  MenuItem(
    title: 'Transport',
    icon: Icons.directions_bus,
    color: Colors.amber,
    page: const TransportPage(),
  ),
  MenuItem(
    title: 'Notice Board',
    icon: Icons.campaign,
    color: Colors.pink,
    page: const NoticeBoardPage(),
  ),
];
