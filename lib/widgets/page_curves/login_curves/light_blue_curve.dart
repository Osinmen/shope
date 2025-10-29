import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(201.008, 266.33);
    path_0.cubicTo(
        161.149, 422.443, -19.5441, 258.17, -61.2191, 155.021);
    path_0.cubicTo(-102.894, 51.8718, -53.0593, -65.5313, 50.0897, -107.206);
    path_0.cubicTo(153.239, -148.881, 237.498, -79.7022, 282.998, 11.2978);
    path_0.cubicTo(328.498, 102.298, 240.867, 110.216, 201.008, 266.33);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffD9E4FF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
