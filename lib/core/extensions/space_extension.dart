import 'package:flutter/material.dart';

extension SpaceExtension on num {
  Widget get h => SizedBox(height: toDouble());

  Widget get w => SizedBox(width: toDouble());
}
