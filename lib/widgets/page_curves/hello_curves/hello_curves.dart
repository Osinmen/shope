import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class HelloCurves extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(53.9996,-83.545);
    path_0.cubicTo(149.438,-213.36,255.435,6.64084,255.435,117.891);
    path_0.cubicTo(255.435,229.141,165.25,319.326,53.9996,319.326);
    path_0.cubicTo(-57.2502,319.326,-147.436,229.141,-147.436,117.891);
    path_0.cubicTo(-147.436,6.64084,-41.4385,46.2696,53.9996,-83.545);
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