import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../viewmodels/main_controller.dart';
import 'home_view.dart';
import 'plan_view.dart';
import 'mood_view.dart';
import 'profile_view.dart';
import '../core/constants/app_assets.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    final List<Widget> screens = const [
      HomeView(),
      PlanView(),
      MoodView(),
      ProfileView(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: AppColors.background,
            currentIndex: controller.currentIndex.value,
            onTap: controller.setIndex,
            selectedItemColor: AppColors.textMain,
            unselectedItemColor: AppColors.bottomNavUnselected,
            selectedLabelStyle: AppFonts.navLabel.copyWith(
              color: AppColors.textMain,
            ),
            unselectedLabelStyle: AppFonts.navLabel,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              _buildNavItem(
                AppAssets.nutritionIcon,
                'Nutrition',
                0,
                controller.currentIndex.value,
              ),
              _buildNavItem(
                AppAssets.planIcon,
                'Plan',
                1,
                controller.currentIndex.value,
              ),
              _buildNavItem(
                AppAssets.moodIcon,
                'Mood',
                2,
                controller.currentIndex.value,
              ),
              _buildNavItem(
                AppAssets.profileIcon,
                'Profile',
                3,
                controller.currentIndex.value,
                isPng: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String asset,
    String label,
    int index,
    int currentIndex, {
    bool isPng = false,
  }) {
    final isSelected = index == currentIndex;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: isPng
            ? Image.asset(
                asset,
                width: 24,
                height: 24,
                color: isSelected
                    ? AppColors.textMain
                    : AppColors.bottomNavUnselected,
              )
            : SvgPicture.asset(
                asset,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? AppColors.textMain
                      : AppColors.bottomNavUnselected,
                  BlendMode.srcIn,
                ),
              ),
      ),
      label: label,
    );
  }
}
