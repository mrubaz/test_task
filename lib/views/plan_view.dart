import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/extensions/space_extension.dart';
import '../widgets/workout_day_row.dart';
import '../core/constants/app_assets.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Training Calendar',
          style: AppFonts.heading.copyWith(fontSize: 22),
        ),
        backgroundColor: AppColors.background,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Text(
                'Save',
                style: AppFonts.heading.copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 2, color: AppColors.primaryBlue),
              _buildWeekSection(
                title: 'Week 2/8',
                dates: 'December 8-14',
                totalTime: 'Total: 60min',
                children: [
                  const WorkoutDayRow(
                    dayName: 'Mon',
                    dayNumber: '8',
                    hasWorkout: true,
                    workoutType: 'Arms Workout',
                    workoutTitle: 'Arm Blaster',
                    workoutDuration: '25m - 30m',
                    iconPath: AppAssets.armsWorkout,
                    chipColor: AppColors.primaryGreen,
                  ),
                  const WorkoutDayRow(dayName: 'Tue', dayNumber: '9'),
                  const WorkoutDayRow(dayName: 'Wed', dayNumber: '10'),
                  const WorkoutDayRow(
                    dayName: 'Thu',
                    dayNumber: '11',
                    hasWorkout: true,
                    workoutType: 'Leg Workout',
                    workoutTitle: 'Leg Day Blitz',
                    workoutDuration: '25m - 30m',
                    iconPath: AppAssets.legWorkout,
                    chipColor: AppColors.primaryBlue,
                  ),
                  const WorkoutDayRow(dayName: 'Fri', dayNumber: '12'),
                  const WorkoutDayRow(dayName: 'Sat', dayNumber: '13'),
                  const WorkoutDayRow(dayName: 'Sun', dayNumber: '14'),
                ],
              ),
              Container(height: 2, color: AppColors.cyan),
              _buildWeekSection(
                title: 'Week 2',
                dates: 'December 14-22',
                totalTime: 'Total: 60min',
                children: [
                  // Further weeks
                  40.h,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekSection({
    required String title,
    required String dates,
    required String totalTime,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppFonts.heading.copyWith(fontSize: 18)),
              Text(
                totalTime,
                style: AppFonts.body.copyWith(
                  color: AppColors.bottomNavUnselected,
                ),
              ),
            ],
          ),
          4.h,
          Text(
            dates,
            style: AppFonts.body.copyWith(color: AppColors.bottomNavUnselected),
          ),
          24.h,
          ...children,
        ],
      ),
    );
  }
}
