import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/logo_horizotal/qmbuddy_logo_horizontal.png',
          width: 150,
          height: 45,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'QM BUDDY',
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              // TODO: Navigate to Notifications
            },
            icon: const Icon(LucideIcons.bell),
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
