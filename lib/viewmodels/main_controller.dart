import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}
