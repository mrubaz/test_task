import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class InsightCards extends StatelessWidget {
  final int calories;
  final int remainingCalories;
  final int totalCalories;
  final double weight;
  final double weightChange;

  const InsightCards({
    super.key,
    required this.calories,
    required this.remainingCalories,
    required this.totalCalories,
    required this.weight,
    required this.weightChange,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '$calories',
                      style: AppFonts.heading.copyWith(
                        fontSize: 38,
                        fontWeight: .w600,
                      ),
                      children: [
                        const TextSpan(
                          text: ' Calories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$remainingCalories Remaining',
                    style: AppFonts.navLabel.copyWith(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: AppColors.bottomNavUnselected,
                    ),
                  ),
                  24.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '0',
                        style: AppFonts.navLabel.copyWith(
                          color: AppColors.bottomNavUnselected,
                        ),
                      ),
                      Text(
                        '$totalCalories',
                        style: AppFonts.navLabel.copyWith(
                          color: AppColors.bottomNavUnselected,
                        ),
                      ),
                    ],
                  ),
                  4.h,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: calories / totalCalories,
                      backgroundColor: AppColors.bottomNavUnselected.withValues(
                        alpha: 0.3,
                      ),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryGreen,
                      ),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.w,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '${weight.toInt()}',
                      style: AppFonts.heading.copyWith(fontSize: 36),
                      children: [
                        TextSpan(
                          text: ' kg',
                          style: AppFonts.body.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_outward,
                          color: AppColors.primaryGreen,
                          size: 12,
                        ),
                      ),
                      8.w,
                      Text(
                        '+${weightChange}kg',
                        style: AppFonts.navLabel.copyWith(
                          color: AppColors.bottomNavUnselected,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(), // Use Spacer to push Weight to bottom
                  Text(
                    'Weight',
                    style: AppFonts.heading.copyWith(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
