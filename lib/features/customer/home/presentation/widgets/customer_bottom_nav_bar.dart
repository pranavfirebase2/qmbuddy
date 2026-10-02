import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../core/theme/app_colors.dart';

class CustomerBottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const CustomerBottomNavBar({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CrystalNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _goBranch,
        indicatorColor: AppColors.primary,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        outlineBorderColor: Colors.grey.shade500,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        items: [
          CrystalNavigationBarItem(
            icon: LucideIcons.home,
            selectedColor: AppColors.primary,
          ),
          CrystalNavigationBarItem(
            icon: LucideIcons.bookOpen,
            selectedColor: AppColors.primary,
          ),
          CrystalNavigationBarItem(
            icon: LucideIcons.clipboardList,
            selectedColor: AppColors.primary,
          ),
          CrystalNavigationBarItem(
            icon: LucideIcons.user,
            selectedColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
