import 'package:get/get.dart';

class HomeController extends GetxController {
  // Calendar state
  final selectedDate = 22.obs;

  // Insight states
  final calories = 550.obs;
  final remainingCalories = 1950.obs;
  final totalCalories = 2500.obs;
  
  final weight = 75.0.obs;
  final weightChange = 1.6.obs;

  final hydrationPercentage = 0.obs;
  final hydrationLog = 0.obs;
  final hydrationGoal = 2000.obs; // in ml

  void selectDate(int date) {
    selectedDate.value = date;
  }

  void addWater(int ml) {
    hydrationLog.value += ml;
    if (hydrationLog.value > hydrationGoal.value) {
      hydrationLog.value = hydrationGoal.value;
    }
    hydrationPercentage.value = ((hydrationLog.value / hydrationGoal.value) * 100).toInt();
  }
}
