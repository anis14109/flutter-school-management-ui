# School Management Dashboard UI

A modern Flutter UI application for school management with Riverpod state management.

## Project Structure

```
lib/
├── main.dart                    # App entry point with ProviderScope
├── models/
│   └── models.dart              # Data models (MenuItem, BottomNavItem)
├── providers/
│   └── navigation_provider.dart # Riverpod state management for navigation
├── data/
│   └── menu_data.dart           # Static menu configuration
├── screens/
│   ├── splash_screen.dart       # Animated splash screen
│   ├── dashboard_screen.dart    # Main dashboard with menu cards
│   ├── page_with_bottom_nav.dart# Reusable page with bottom navigation
│   ├── student_screen.dart      # Students management page
│   ├── teacher_screen.dart      # Teachers management page
│   ├── parent_screen.dart       # Parents management page
│   ├── attendance_screen.dart   # Attendance management page
│   ├── exam_screen.dart         # Exams management page
│   ├── result_screen.dart       # Results management page
│   ├── fee_screen.dart          # Fees management page
│   ├── library_screen.dart      # Library management page
│   ├── transport_screen.dart    # Transport management page
│   └── notice_board_screen.dart # Notice board management page
├── widgets/
│   ├── navigation_drawer.dart   # Side navigation drawer
│   └── menu_card.dart           # Reusable menu card widget
└── views/
    └── views.dart                # Placeholder views for each section
```

## Features

- **Splash Screen**: Animated loading screen with logo and progress indicator
- **Dashboard**: Responsive grid of menu cards for different school modules
- **Navigation Drawer**: Right-side drawer with profile and navigation options
- **Module Pages**: Each module (Students, Teachers, etc.) has its own page with:
  - Horizontal scrolling bottom navigation
  - Multiple sub-sections accessible via bottom nav
  - Floating action button
  - Search functionality in app bar
- **Responsive Design**: Grid adapts from 2-5 columns based on screen width
- **Material 3**: Modern Material Design theming

## Riverpod State Management

The app uses **Riverpod** for state management:

- `navigationProvider`: StateNotifierProvider that manages:
  - `selectedIndex`: Current bottom navigation index
  - `currentPage`: Current page identifier
  - `setSelectedIndex()`: Update selected navigation item
  - `setCurrentPage()`: Update current page
  - `reset()`: Reset to default state

### Provider Usage

```dart
// Reading state
final navState = ref.watch(navigationProvider);

// Updating state
ref.read(navigationProvider.notifier).setSelectedIndex(2);
```

## Modules

1. **Students**: All Students, Add New, ID Cards, Export
2. **Teachers**: All Teachers, Add New, Schedule, Subjects
3. **Parents**: All Parents, Messages, Feedback
4. **Attendance**: Mark, Records, Reports
5. **Exams**: Schedule, Create, Seating
6. **Results**: Publish, Analysis, Download
7. **Fees**: Collect, Records, Accounts
8. **Library**: Books, Issue, Returns
9. **Transport**: Routes, Drivers, Tracking
10. **Notice Board**: Notices, Create, Send

## Getting Started

### Prerequisites
- Flutter SDK 3.x
- Dart SDK 3.x

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

### Dependencies

- `flutter_riverpod: ^2.6.1` - State management
- `cupertino_icons: ^1.0.8` - iOS style icons

## Code Explanation

### Main Entry Point
- Uses `ProviderScope` to wrap the app for Riverpod
- Sets up MaterialApp with Material 3 theming
- Launches splash screen first

### Splash Screen
- Uses `AnimationController` for fade and scale animations
- 3-second delay before navigating to dashboard
- Smooth fade transition to main screen

### Dashboard Screen
- Uses `GridView.count` with responsive column count
- Each menu card navigates to its respective module page
- Uses Riverpod's `ConsumerWidget` for efficient rebuilds

### Page with Bottom Navigation
- Reusable component for all module pages
- Horizontal scrolling bottom nav with `SingleChildScrollView`
- Bounds checking prevents index out of range errors
- Dynamic body switching based on selected index

### Models
- `MenuItem`: Title, icon, color, and page widget
- `BottomNavItem`: Selected icon, unselected icon, and label
