import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';
import '../viewmodels/mood_controller.dart';
import '../widgets/custom_button.dart';
import '../core/constants/app_assets.dart';

class MoodView extends StatelessWidget {
  const MoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MoodController());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.moodGlow, AppColors.background],
            stops: [0.0, 0.4],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mood', style: AppFonts.heading.copyWith(fontSize: 28)),
                32.h,
                Text(
                  'Start your day',
                  style: AppFonts.navLabel.copyWith(
                    color: AppColors.textMain,
                    fontSize: 16,
                  ),
                ),
                8.h,
                Text(
                  'How are you feeling at the\nMoment?',
                  style: AppFonts.heading.copyWith(fontSize: 24, height: 1.3),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildMoodSlider(controller),
                        32.h,
                        Obx(
                          () => Text(
                            controller.currentMood,
                            style: AppFonts.heading.copyWith(fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  text: 'Continue',
                  backgroundColor:
                      AppColors.textMain, // White custom configuration
                  textColor: AppColors.background, // Black custom configuration
                ),
                16.h,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodSlider(MoodController controller) {
    double ringSize = 280;
    double orbitRadius = 125;
    double thumbSize = 44;

    return SizedBox(
      width: orbitRadius * 2 + thumbSize,
      height: orbitRadius * 2 + thumbSize,
      child: GestureDetector(
        onPanStart: (details) {
          Offset center = Offset(
            orbitRadius + thumbSize / 2,
            orbitRadius + thumbSize / 2,
          );
          controller.updateAngleByOffset(details.localPosition, center);
        },
        onPanUpdate: (details) {
          Offset center = Offset(
            orbitRadius + thumbSize / 2,
            orbitRadius + thumbSize / 2,
          );
          controller.updateAngleByOffset(details.localPosition, center);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.moodCircle, width: ringSize, height: ringSize),
            Obx(() => Image.asset(controller.currentFacePath, width: 110)),
            Obx(() {
              double radians = controller.currentAngle.value * math.pi / 180;
              double thumbX = orbitRadius * math.cos(radians);
              double thumbY = orbitRadius * math.sin(radians);

              double centerX = orbitRadius + thumbSize / 2;
              double centerY = orbitRadius + thumbSize / 2;

              return Positioned(
                left: centerX + thumbX - thumbSize / 2,
                top: centerY + thumbY - thumbSize / 2,
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    color: AppColors.moodThumb, // Frosty white shade like the design
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.2),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
