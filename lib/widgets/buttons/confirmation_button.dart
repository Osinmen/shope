import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';

class ConfirmationButton extends StatelessWidget {
  final String text;
final VoidCallback onPressed;
  const ConfirmationButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          color: AppColors.primaryColor, 
          borderRadius: BorderRadius.circular(25), 
        ),
        child: Center(
          child: Text(text, style: AppTextStyles.bodyMediumLight(), )
        ),
      ),
    );
  }
}