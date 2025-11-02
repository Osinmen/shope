import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';

class PaymentStatusTabs extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const PaymentStatusTabs({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[200], 
          borderRadius: BorderRadius.circular(30), 
        ),
        child: Center(child: Text(text, style: AppTextStyles.bodySmallLight(AppColors.primaryColor),)), 
      ),
    );
  }
}