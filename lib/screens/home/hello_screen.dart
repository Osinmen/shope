import 'package:flutter/material.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/widgets/page_curves/hello_curves/hello_curves.dart';

class HelloScreen extends StatefulWidget {
  const HelloScreen({super.key});

  @override
  State<HelloScreen> createState() => _HelloScreenState();
}

class _HelloScreenState extends State<HelloScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Stack(
          children: [
            CustomPaint(
                size: Size(256, 320), 
                painter: HelloCurves(),
            ), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Card(
                  
                elevation: 4,
                color: AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(

                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.images.happyGirl.path), fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
          
                    mainAxisSize: MainAxisSize.min,
                    children: [
            
                      Container(
                        height: 350 ,
                        decoration: BoxDecoration(
                       
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                       
                      ),
                      // Content section
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 70),
                        child: Column(
                          children: [
                            const Text(
                              'Hello',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                            ),
              )
            )
          ],
        ),
      ),
    );
  }
}