import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularPercentPaint extends CustomPainter {
  final int progress;
  final bool isFirstHalf;
  final bool isBreak;
  final bool allGreen;
  CircularPercentPaint(
      {required this.progress,
      this.isFirstHalf = true,
      this.isBreak = false,
      this.allGreen = false});
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  @override
  void paint(Canvas canvas, Size size) {
    /// brush
    var fillBrush = Paint()
      ..color = Colors.green.shade900 //const Color(0xFF444974).withOpacity(.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;

    /// variable initialization
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY) + 15;
    var sweepAngle = -2 * pi * progress;
    var breakAngle = -2 * pi * .1;
    var outerCircleRadius = radius + 3;
    var innerCircleRadius = radius - 3;
    var angle = progress / 100 * 355;
    var startAngle = !isFirstHalf
        ? (.6 * 355).toInt()
        : isBreak
            ? (349.2 ~/ 2) - 20
            : 5;
    if (isFirstHalf) {
      if (!isBreak) {
        // canvas.drawArc(
        //     Rect.fromCircle(center: center, radius: radius),
        //     startAngle.toDouble(),
        //     355,
        //     false,
        //     fillBrush..color = Colors.grey.shade200);
        for (int i = startAngle;
            i <
                (allGreen
                    ? angle
                    : progress < 46
                        ? angle
                        : (349 ~/ 2 - 7));
            i++) {
          var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
          var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

          var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
          var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
          canvas.drawLine(
              Offset(x1, y1),
              Offset(x2, y2),
              fillBrush
                ..color = Colors.green.shade800
                ..strokeWidth = 6
                ..strokeCap = StrokeCap.round);
        }
      } else {
        for (int i = startAngle; i < angle; i++) {
          var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
          var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

          var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
          var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
          canvas.drawLine(
              Offset(x1, y1),
              Offset(x2, y2),
              fillBrush
                ..color = Colors.orange.shade600
                ..strokeWidth = 6
                ..strokeCap = StrokeCap.round);
        }
      }
    } else {
      for (int i = startAngle; i < angle; i++) {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
        var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
        canvas.drawLine(
            Offset(x1, y1),
            Offset(x2, y2),
            fillBrush
              ..strokeWidth = 6
              ..strokeCap = StrokeCap.round);
      }
    }
  }
}
