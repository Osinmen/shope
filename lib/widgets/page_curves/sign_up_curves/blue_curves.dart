import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class BlueSignUpCurveBackground extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(122.23,23.973);
    path_0.cubicTo(179.747,-54.2618,243.628,78.3248,243.628,145.371);
    path_0.cubicTo(243.628,212.418,189.276,266.77,122.23,266.77);
    path_0.cubicTo(55.1834,266.77,-8.01705,215.723,0.831575,145.371);
    path_0.cubicTo(9.6802,75.0195,64.7126,102.208,122.23,23.973);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff004BFE).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}