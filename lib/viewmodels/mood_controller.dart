import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/app_assets.dart';

class MoodController extends GetxController {
  // Start with Calm at around -45 (top right quadrant)
  var currentAngle = (-45.0).obs;

  String get currentMood {
    double a = currentAngle.value % 360;
    if (a < 0) a += 360;
    
    if (a >= 270 && a <= 360) return 'Calm'; // Top Right
    if (a >= 0 && a < 90) return 'Content'; // Bottom Right
    if (a >= 90 && a < 180) return 'Peaceful'; // Bottom Left
    if (a >= 180 && a < 270) return 'Happy'; // Top Left
    return 'Calm';
  }

  String get currentFacePath {
    switch(currentMood) {
      case 'Calm': return AppAssets.calmMood;
      case 'Content': return AppAssets.contentMood;
      case 'Peaceful': return AppAssets.peacefulMood;
      case 'Happy': return AppAssets.happyMood;
      default: return AppAssets.calmMood;
    }
  }

  void updateAngleByOffset(Offset localPosition, Offset center) {
    double radians = math.atan2(localPosition.dy - center.dy, localPosition.dx - center.dx);
    currentAngle.value = radians * 180 / math.pi;
  }
}
