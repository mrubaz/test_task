import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class CalendarBottomSheet extends StatelessWidget {
  const CalendarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold/Container for bottom sheet
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.bottomNavUnselected,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          20.h,
          // Header (Month Year)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textMain,
                  size: 16,
                ),
                onPressed: () {},
              ),
              Text('Sep 2024', style: AppFonts.heading.copyWith(fontSize: 18)),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textMain,
                  size: 16,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Days of week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: AppFonts.navLabel.copyWith(
                          color: AppColors.textMain,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          16.h,
          // Calendar Grid Placeholder
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
            ),
            itemCount: 30, // Sept has 30 days
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = day == 2;
              return GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppColors.primaryGreen, width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      day.toString(),
                      style: AppFonts.body.copyWith(
                        color: AppColors.textMain,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          24.h,
        ],
      ),
    );
  }
}
