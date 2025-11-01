import 'package:flutter/material.dart';

class RecentlyViewed extends StatelessWidget {
  const RecentlyViewed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Card(
        elevation: 7,
        shape: CircleBorder(),
        child: Padding(padding: const EdgeInsets.all(10),
         child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            color: Colors.blue
          ),
         ),),
      ),
    );
  }
}