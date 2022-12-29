// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hajir/app/config/app_colors.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.8453333333333334).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: ArcPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class ArcPainter extends CustomPainter {
  Color color;
  ArcPainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.09066667, size.height * -0.1892744);
    path_0.lineTo(size.width * 1.088000, size.height * -0.1892744);
    path_0.lineTo(size.width * 1.088000, size.height);
    path_0.cubicTo(
        size.width * 0.6438480,
        size.height * 0.8762461,
        size.width * 0.3862187,
        size.height * 0.8728770,
        size.width * -0.09066667,
        size.height);
    path_0.lineTo(size.width * -0.09066667, size.height * -0.1892744);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color.withOpacity(.1);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}