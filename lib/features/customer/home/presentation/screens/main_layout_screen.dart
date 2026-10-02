import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/customer_bottom_nav_bar.dart';

class MainLayoutScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayoutScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    // Hide bottom nav for Menu tab (index 1)
    final hideBottomNav = navigationShell.currentIndex == 1;

    return Scaffold(
      backgroundColor: AppColors.surface,
      extendBody: true, // This is important for floating nav bar
      body: SafeArea(
        bottom: false,
        child: navigationShell, // The StatefulShellRoute handles the IndexedStack internally!
      ),
      bottomNavigationBar: hideBottomNav ? null : CustomerBottomNavBar(navigationShell: navigationShell),
    );
  }
}
