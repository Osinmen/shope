import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';
import 'package:shope/core/utils/sized_box_extensions.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/widgets/page_curves/hello_curves/hello_curves.dart';

class ReadyScreen extends StatefulWidget {
  const ReadyScreen({super.key});

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          CustomPaint(size: Size(256, 320), painter: HelloCurves()),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 7,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.images.twoHappyGirls.path,
                              ),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 28,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Ready?",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            10.height,
                            Text(
                              'Lorem ipsum dolor sit amet,\n consectetur adispiscing elit',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyMediumLight(
                                Colors.black,
                              ),
                            ),
                            10.height,
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 45,
                                ),
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                "Let's Start",
                                style: AppTextStyles.bodyLargeLight(
                                  Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
