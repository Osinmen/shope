import 'package:flutter/material.dart';
import 'package:shope/gen/assets.gen.dart';


class SomeContainer extends StatelessWidget {
  final String? imagePath;
  const SomeContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.grey[200], 
       shape: BoxShape.circle, 
      ),
      child: Image.asset(imagePath.toString(), height: 20, width: 20,)
    );
  }
}