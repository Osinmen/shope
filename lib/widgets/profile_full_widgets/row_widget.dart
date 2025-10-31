import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/widgets/random_widgets/some_container.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: Card(
                  elevation: 7,
                  shape: CircleBorder(),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 25,
                ),

                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "My Activity",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SomeContainer(imagePath: Assets.icons.rectangular.path),
                    SomeContainer(imagePath: Assets.icons.sort.path),
                    SomeContainer(imagePath: Assets.icons.settings.path),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
