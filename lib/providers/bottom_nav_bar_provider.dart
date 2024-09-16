import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBarNotifier extends StateNotifier<int> {
  BottomNavBarNotifier() : super(0);

  void onTab(int value) => state = value;
}

/// Create a Riverpod provider for the ThemeNotifier
final bottomNavBarNotifierProvider =
    StateNotifierProvider<BottomNavBarNotifier, int>(
  (ref) {
    return BottomNavBarNotifier();
  },
);
