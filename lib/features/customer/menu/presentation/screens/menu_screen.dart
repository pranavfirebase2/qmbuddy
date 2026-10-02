import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../core/constants/strings/menu_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/menu_bottom_cart_nav.dart';
import '../widgets/menu_header.dart';
import '../widgets/menu_category_sidebar.dart';
import '../widgets/menu_items_grid.dart';
import '../providers/menu_ui_providers.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final isVegOnly = ref.watch(vegOnlyProvider);
    
    return Scaffold(
      bottomNavigationBar: const MenuBottomCartNav(),
      body: Container(
        child: SafeArea(
          bottom: false,
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MenuHeader(),
              
              // Filter & Search Row
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Veg Toggle
                    SizedBox(
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => ref.read(vegOnlyProvider.notifier).state = !isVegOnly,
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                            decoration: BoxDecoration(
                              color: AppColors.surface,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shadowColor.withOpacity(0.06),
                                  blurRadius: 8,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.success, width: 1.5),
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 4,
                                          height: 4,
                                          decoration: const BoxDecoration(
                                            color: AppColors.success,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      MenuStrings.veg,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: isVegOnly ? AppColors.success : AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 24,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Switch(
                                      value: isVegOnly,
                                      onChanged: (value) {
                                        ref.read(vegOnlyProvider.notifier).state = value;
                                      },
                                      activeColor: AppColors.success,
                                      activeTrackColor: AppColors.successLight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // Search Bar
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: SizedBox(
                          height: 44,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: MenuStrings.items,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                color: AppColors.textMuted,
                              ),
                              prefixIcon: const Icon(
                                LucideIcons.search,
                                size: 18,
                                color: AppColors.textSecondary,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 16,
                              ),
                              filled: true,
                              fillColor: AppColors.surface,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.borderLight,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Side: Categories
                    const MenuCategorySidebar(),

                    const VerticalDivider(width: 1, color: Colors.black12),

                    // Right Side: Items Grid
                    const Expanded(child: MenuItemsGrid()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
