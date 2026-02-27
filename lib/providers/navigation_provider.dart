import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationState {
  final int selectedIndex;
  final String currentPage;

  const NavigationState({
    this.selectedIndex = 0,
    this.currentPage = 'dashboard',
  });

  NavigationState copyWith({
    int? selectedIndex,
    String? currentPage,
  }) {
    return NavigationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(const NavigationState());

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void setCurrentPage(String page) {
    state = state.copyWith(currentPage: page);
  }

  void reset() {
    state = const NavigationState();
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, NavigationState>((ref) {
  return NavigationNotifier();
});
