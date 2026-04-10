import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task/core/extensions/space_extension.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../viewmodels/home_controller.dart';
import '../widgets/calendar_row.dart';
import '../widgets/workout_card.dart';
import '../widgets/insight_cards.dart';
import '../widgets/hydration_card.dart';
import '../core/constants/app_assets.dart';
import '../widgets/calendar_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(AppAssets.notificationIcon, width: 24, height: 24, color: AppColors.textMain),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.weekIcon,
                        width: 18,
                        height: 18,
                        colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
                      ),
                      8.w,
                      Text('Week 1/4', style: AppFonts.body.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
                      const Icon(Icons.arrow_drop_down, color: AppColors.textMain),
                    ],
                  ),
                ],
              ),
              24.h,
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(const CalendarBottomSheet(), isScrollControlled: true);
                },
                child: Text('Today, 22 Dec 2024', style: AppFonts.heading.copyWith(fontSize: 16)),
              ),
              16.h,

              Obx(
                () => CalendarRow(
                  selectedDate: controller.selectedDate.value,
                  onDateSelected: (date) {
                    controller.selectDate(date);
                    Get.bottomSheet(const CalendarBottomSheet(), isScrollControlled: true);
                  },
                ),
              ),

              24.h,
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(2)),
                ),
              ),
              24.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Workouts', style: AppFonts.heading.copyWith(fontSize: 24, fontWeight: .w600)),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.workoutsIcon,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(AppColors.textMain, BlendMode.srcIn),
                      ),
                      6.w,
                      Text('9°', style: AppFonts.heading.copyWith(fontSize: 24, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              16.h,

              const WorkoutCard(dateAndDuration: 'December 22 - 25m - 30m', title: 'Upper Body'),

              24.h,
              Text('My Insights', style: AppFonts.heading.copyWith(fontSize: 24, fontWeight: .w600)),
              16.h,

              Obx(
                () => InsightCards(
                  calories: controller.calories.value,
                  remainingCalories: controller.remainingCalories.value,
                  totalCalories: controller.totalCalories.value,
                  weight: controller.weight.value,
                  weightChange: controller.weightChange.value,
                ),
              ),

              16.h,

              Obx(
                () => HydrationCard(
                  percentage: controller.hydrationPercentage.value,
                  currentLog: controller.hydrationLog.value,
                  goal: controller.hydrationGoal.value,
                  onLogAdded: () => controller.addWater(500),
                ),
              ),

              24.h,
            ],
          ),
        ),
      ),
    );
  }
}
