import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/strings/menu_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../providers/menu_ui_providers.dart';

class MenuBottomCartNav extends ConsumerWidget {
  const MenuBottomCartNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCartExpanded = ref.watch(isCartExpandedProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Expanded Cart Items Container
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isCartExpanded ? MediaQuery.of(context).size.height * 0.45 : 0,
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                offset: Offset(0, -4),
                blurRadius: 10,
              )
            ]
          ),
          child: isCartExpanded
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              MenuStrings.quickCart,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w900,
                                    color: AppColors.textPrimary,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(LucideIcons.x, size: 20),
                              onPressed: () => ref.read(isCartExpandedProvider.notifier).state = false,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        itemCount: 2, // Dummy count
                        separatorBuilder: (context, index) => const Divider(height: 24),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Item Photo
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://thumbs.dreamstime.com/b/lots-kfc-chicken-hot-wings-strips-bucket-moscow-russia-july-kentucky-fried-fast-food-isolated-white-background-192188137.jpg',
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),
                              // Item Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      MenuStrings.dummyItemName,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Quantity Controls
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: AppColors.border),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                              child: Icon(LucideIcons.minus, size: 14),
                                            ),
                                          ),
                                          Text(
                                            '1', 
                                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                              child: Icon(LucideIcons.plus, size: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Right Side: Delete & Price
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(LucideIcons.trash2, size: 18, color: AppColors.errorLight),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    MenuStrings.dummyItemPrice,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: AppColors.textDark,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
        
        // Upward/Downward Arrow / Handle
        GestureDetector(
          onTap: () => ref.read(isCartExpandedProvider.notifier).state = !isCartExpanded,
          child: Container(
            width: 60,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: isCartExpanded 
                  ? BorderRadius.zero 
                  : const BorderRadius.vertical(top: Radius.circular(12)),
              boxShadow: isCartExpanded ? null : [
                BoxShadow(
                  color: AppColors.shadowColor,
                  offset: const Offset(0, -3),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Icon(
                isCartExpanded ? LucideIcons.chevronDown : LucideIcons.chevronUp,
                size: 20, 
                color: AppColors.textSecondary
              ),
            ),
          ),
        ),
        // Main Bottom Bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                offset: const Offset(0, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: Cart Info
                GestureDetector(
                  onTap: () => ref.read(isCartExpandedProvider.notifier).state = !isCartExpanded,
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(LucideIcons.shoppingCart, size: 28, color: AppColors.textPrimary),
                          Positioned(
                            right: -4,
                            top: -4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '2',
                                style: TextStyle(color: AppColors.surface, fontSize: 10, fontWeight: FontWeight.bold, height: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            MenuStrings.totalWithTax,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.textMuted,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            MenuStrings.dummyTotalAmount,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Right: Go to Cart Button
                ElevatedButton(
                  onPressed: () => context.push('/cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.surface,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    MenuStrings.goToCart,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
