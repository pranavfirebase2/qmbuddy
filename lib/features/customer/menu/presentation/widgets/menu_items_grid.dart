import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../core/constants/strings/menu_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import 'menu_item_card.dart';

class MenuItemsGrid extends StatelessWidget {
  const MenuItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 120),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 2,
        childAspectRatio: isTablet ? 0.65 : 0.72,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return MenuItemCard(index: index);
      },
    );
  }
}
