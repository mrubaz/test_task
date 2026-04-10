import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class WorkoutDayRow extends StatelessWidget {
  final String dayName;
  final String dayNumber;
  final bool hasWorkout;
  final String? workoutType; // 'arms' or 'legs'
  final String? workoutTitle;
  final String? workoutDuration;
  final Color? chipColor;
  final String? iconPath;

  const WorkoutDayRow({
    super.key,
    required this.dayName,
    required this.dayNumber,
    this.hasWorkout = false,
    this.workoutType,
    this.workoutTitle,
    this.workoutDuration,
    this.chipColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: hasWorkout
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                Text(
                  dayName,
                  style: AppFonts.navLabel.copyWith(
                    color: hasWorkout
                        ? AppColors.textMain
                        : AppColors.bottomNavUnselected,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                4.h,
                Text(
                  dayNumber,
                  style: AppFonts.heading.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: hasWorkout
                        ? AppColors.textMain
                        : AppColors.bottomNavUnselected,
                  ),
                ),
              ],
            ),
          ),
          12.w,
          Expanded(
            child: hasWorkout
                ? _buildWorkoutCard()
                : Column(
                    children: [
                      20.h,
                      Divider(color: AppColors.surface, height: 1),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 8,
              decoration: const BoxDecoration(
                color: AppColors.textMain,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4, right: 8),
                      child: Icon(
                        Icons.drag_indicator,
                        color: AppColors.bottomNavUnselected,
                        size: 16,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: chipColor?.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  iconPath!,
                                  width: 12,
                                  height: 12,
                                  colorFilter: ColorFilter.mode(
                                    chipColor!,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                4.w,
                                Text(
                                  workoutType!,
                                  style: AppFonts.navLabel.copyWith(
                                    color: chipColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          4.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(workoutTitle!, style: AppFonts.body),
                              Text(
                                workoutDuration!,
                                style: AppFonts.navLabel.copyWith(
                                  color: AppColors.bottomNavUnselected,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
