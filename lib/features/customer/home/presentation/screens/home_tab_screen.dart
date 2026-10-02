import 'package:flutter/material.dart';

import '../../../../../core/constants/strings/home_strings.dart';
import '../../../../../core/theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/home_quote.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_ad_card.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const HomeHeader(),
            const SizedBox(height: 32),
            const HomeQuote(),
            const SizedBox(height: 24),
            const HomeSearchBar(),
            const SizedBox(height: 32),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  HomeStrings.featuredShops,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  HomeStrings.viewAll,
                  style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Standard Vertical Cards
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return HomeAdCard(index: index);
              },
            ),
            
            // Give some space for bottom nav bar
            const SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }
}
