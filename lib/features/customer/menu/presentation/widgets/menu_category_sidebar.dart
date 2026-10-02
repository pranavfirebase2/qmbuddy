import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/strings/menu_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../providers/menu_ui_providers.dart';

class MenuCategorySidebar extends ConsumerWidget {
  const MenuCategorySidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryIndex = ref.watch(selectedCategoryProvider);
 final isVegOnly = ref.watch(vegOnlyProvider);
    return Container(
      width: 90,
      color: AppColors.surface,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: MenuStrings.dummyCategories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              ref.read(selectedCategoryProvider.notifier).state = index;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.surface : Colors.transparent,
                border: Border(
                  left: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 4,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.network(
                        'https://t4.ftcdn.net/jpg/03/21/32/45/360_F_321324549_3utrdpZOFdsyUElymaPhm5LXRyTpnteh.jpg',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    MenuStrings.dummyCategories[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textPrimary,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
