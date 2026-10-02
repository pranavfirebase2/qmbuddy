import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../core/constants/strings/profile_strings.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // Gradient background matching the design

      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildHeader(context, ref),
            const SizedBox(height: 30),
            _buildProfileInfoCard(context),
            const SizedBox(height: 24),
            _buildOptionsGroup([
              _buildOptionItem(context: context, icon: LucideIcons.user, title: ProfileStrings.profileDetails),
              _buildOptionItem(context: context, icon: LucideIcons.clipboardList, title: ProfileStrings.myOrders),
              _buildOptionItem(context: context, icon: LucideIcons.mapPin, title: ProfileStrings.myAddresses),
              _buildOptionItem(context: context, icon: LucideIcons.creditCard, title: ProfileStrings.paymentMethods),
              _buildOptionItem(context: context, icon: LucideIcons.wallet, title: ProfileStrings.savedCards, isLast: true),
            ]),
            const SizedBox(height: 24),
            _buildOptionsGroup([
              _buildOptionItem(context: context, icon: LucideIcons.bell, title: ProfileStrings.notifications),
              _buildOptionItem(context: context, icon: LucideIcons.moon, title: ProfileStrings.darkMode),
              _buildOptionItem(context: context, icon: LucideIcons.helpCircle, title: ProfileStrings.helpSupport, isLast: true),
            ]),
            const SizedBox(height: 24),
            _buildOptionsGroup([
              _buildOptionItem(
                context: context,
                icon: LucideIcons.logOut,
                title: ProfileStrings.logout,
                isLast: true,
                onTap: () {
                  context.go('/login');
                },
              ),
            ]),
            const SizedBox(height: 120), // Padding to account for floating nav bar
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCircularIconButton(
          icon: LucideIcons.chevronLeft,
          onTap: () {
            context.go('/home'); // Back to home tab
          },
        ),
        Text(
          ProfileStrings.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        _buildCircularIconButton(
          icon: LucideIcons.settings,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildCircularIconButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      width: 48,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.black87, size: 24),
      ),
    );
  }

  Widget _buildProfileInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&q=80&w=200&h=200'),
            backgroundColor: Colors.grey.shade200,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ProfileStrings.dummyName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Text(
                  ProfileStrings.dummyEmail,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.edit, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsGroup(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildOptionItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    bool isLast = false,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          leading: Icon(icon, color: Colors.black54, size: 24),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(LucideIcons.chevronRight, color: Colors.black38, size: 20),
          onTap: onTap ?? () {},
        ),
        if (!isLast)
          Divider(
            height: 1,
            thickness: 1,
            indent: 60,
            endIndent: 20,
            color: Colors.grey.shade100,
          ),
      ],
    );
  }
}
