import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';

class HydrationCard extends StatelessWidget {
  final int percentage;
  final int currentLog;
  final int goal;
  final VoidCallback onLogAdded;

  const HydrationCard({
    super.key,
    required this.percentage,
    required this.currentLog,
    required this.goal,
    required this.onLogAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$percentage%',
                      style: AppFonts.heading.copyWith(
                        fontSize: 40,
                        color: AppColors.lightBlue,
                      ),
                    ),
                    Text(
                      'Hydration',
                      style: AppFonts.heading.copyWith(
                        fontSize: 18,
                        fontWeight: .w700,
                      ),
                    ),
                    Text(
                      'Log Now',
                      style: AppFonts.navLabel.copyWith(
                        color: AppColors.bottomNavUnselected,
                        fontWeight: .w400,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: SizedBox(
                      height: 140,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Y-Axis Labels (2 L and 0 L)
                          Positioned(
                            left: 0,
                            top: 0,
                            height: 20,
                            child: Center(
                              child: Text(
                                '2 L',
                                style: AppFonts.navLabel.copyWith(
                                  color: AppColors.textMain,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            height: 20,
                            child: Center(
                              child: Text(
                                '0 L',
                                style: AppFonts.navLabel.copyWith(
                                  color: AppColors.textMain,
                                ),
                              ),
                            ),
                          ),

                          // Dashes (Aligned to the right of labels)
                          Positioned(
                            left: 30, // Offset from labels
                            top: 8, // Center with the labels
                            bottom: 8,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(17, (index) {
                                if (index.isOdd) {
                                  return const SizedBox(); // Spacer handled by mainAxisAlignment
                                }
                                int dashIndex = index ~/ 2;
                                bool isLarge = dashIndex % 4 == 0;
                                return Container(
                                  width: isLarge ? 12 : 2,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: isLarge
                                        ? AppColors.lightBlue
                                        : AppColors.darkTeal,
                                    borderRadius: isLarge
                                        ? BorderRadius.circular(2)
                                        : null,
                                  ),
                                );
                              }),
                            ),
                          ),

                          // X-Axis Line and ml Label
                          Positioned(
                            bottom:
                                0, // Aligns with the middle of the bottom large dash
                            left: 42, // Start after the bottom dash (30 + 12)
                            right: 0,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 1,
                                    color: AppColors.bottomNavUnselected
                                        .withValues(alpha: 0.3),
                                  ),
                                ),
                                8.w,
                                Text(
                                  '${currentLog}ml',
                                  style: AppFonts.heading.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onLogAdded,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                color: Color(
                  0xFF1B3D45,
                ), // Specific dark teal for the button background
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  '500 ml added to water log',
                  style: AppFonts.body.copyWith(
                    fontSize: 12,
                    fontWeight: .w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
