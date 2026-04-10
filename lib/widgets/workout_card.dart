import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class WorkoutCard extends StatelessWidget {
  final String dateAndDuration;
  final String title;

  const WorkoutCard({
    super.key,
    required this.dateAndDuration,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: const BoxDecoration(
                color: AppColors.cyan,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dateAndDuration,
                          style: AppFonts.navLabel.copyWith(
                            color: AppColors.textMain,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        4.h,
                        Text(
                          title,
                          style: AppFonts.heading.copyWith(fontSize: 24),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward, color: AppColors.textMain),
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
