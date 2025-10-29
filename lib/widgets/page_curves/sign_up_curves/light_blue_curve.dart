import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(149.237,157.191);
    path_0.cubicTo(116.216,286.524,-45.9048,161.1,-68.0053,64.9774);
    path_0.cubicTo(-90.1057,-31.1454,-61.2453,-117.739,24.2087,-152.265);
    path_0.cubicTo(109.663,-186.791,179.467,-129.479,217.161,-54.0902);
    path_0.cubicTo(254.856,21.299,182.259,27.8587,149.237,157.191);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffF2F5FE).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}
@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}