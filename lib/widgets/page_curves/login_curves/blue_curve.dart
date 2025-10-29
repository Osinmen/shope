import 'package:flutter/material.dart';
import 'dart:ui' as ui;


//Add this C
class RSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(42.9996,-131.222);
    path_0.cubicTo(138.438,-261.036,244.435,-41.0359,244.435,70.214);
    path_0.cubicTo(244.435,181.464,154.25,271.65,42.9996,271.65);
    path_0.cubicTo(-68.2502,271.65,-158.436,181.464,-158.436,70.214);
    path_0.cubicTo(-158.436,-41.0359,-52.4385,-1.40715,42.9996,-131.222);
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