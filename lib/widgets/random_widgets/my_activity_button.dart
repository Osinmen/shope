import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';

class MyActivityButton extends StatelessWidget {
  const MyActivityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Text("My Activity", style: AppTextStyles.bodySmallLight(),),
    );
  }
}