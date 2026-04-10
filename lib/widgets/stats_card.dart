import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;

  const StatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor = AppColors.primaryGreen,
    this.bgColor = AppColors.surface,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              8.w,
              Text(
                title,
                style: AppFonts.body.copyWith(
                  color: AppColors.bottomNavUnselected,
                ),
              ),
            ],
          ),
          12.h,
          Text(value, style: AppFonts.heading),
        ],
      ),
    );
  }
}
