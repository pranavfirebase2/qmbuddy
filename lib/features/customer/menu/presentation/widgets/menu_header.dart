import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/constants/strings/menu_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../providers/menu_ui_providers.dart';

class MenuHeader extends ConsumerWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        LucideIcons.chevronLeft,
                    color:     AppColors.textPrimary,
                      ),
                      onPressed: () => context.go('/home'),
                    ),
                    Text(
                      MenuStrings.dummyShopName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/logo_veritical/logo_v.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
