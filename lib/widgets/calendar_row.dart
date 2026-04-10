import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class CalendarRow extends StatelessWidget {
  final int selectedDate;
  final Function(int) onDateSelected;

  const CalendarRow({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final days = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
    final dates = [21, 22, 23, 24, 25, 26, 27];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final date = dates[index];
        final isSelected = date == selectedDate;

        return GestureDetector(
          onTap: () => onDateSelected(date),
          child: Column(
            children: [
              Text(
                days[index],
                style: AppFonts.navLabel.copyWith(
                  color: AppColors.textMain,
                  fontWeight: FontWeight.bold,
                ),
              ),
              12.h,
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected
                      ? AppColors.primaryGreen.withValues(alpha: 0.2)
                      : AppColors.surface,
                  border: isSelected
                      ? Border.all(color: AppColors.primaryGreen, width: 2)
                      : null,
                ),
                child: Center(
                  child: Text(
                    date.toString(),
                    style: AppFonts.body.copyWith(
                      color: AppColors.textMain,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
              8.h,
              if (isSelected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryGreen,
                  ),
                )
              else
                6.h,
            ],
          ),
        );
      }),
    );
  }
}
