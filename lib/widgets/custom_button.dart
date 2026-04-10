import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryGreen,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading 
        ? const SizedBox(
            height: 20, 
            width: 20, 
            child: CircularProgressIndicator(color: AppColors.background, strokeWidth: 2),
          )
        : Text(
            text, 
            style: AppFonts.button.copyWith(color: textColor ?? AppColors.background),
          ),
    );
  }
}
