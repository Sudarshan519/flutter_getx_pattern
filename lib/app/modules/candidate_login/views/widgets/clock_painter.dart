import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hajir/app/config/app_colors.dart';

class ClockPainter extends CustomPainter {
  final dateTime;

  ClockPainter(this.dateTime);

  //60 sec 1 sec- degree

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2 - 8;
    var center = Offset(centerX, centerY + 8);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color(0xFF444974);
    var outlineBrush = Paint()
      // ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    var centerFillBrush = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4;
    var secHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      // ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
      //     .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    var minHandBrush = Paint()
      ..strokeCap = StrokeCap.round
      // ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
      //     .createShader(Rect.fromCircle(center: center, radius: radius))
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    var hourHandBrush = Paint()
      // ..shader = const RadialGradient(colors: [Colors.lightBlue, Colors.pink])
      //     .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    var dashBrush = Paint()..color = Colors.grey.shade200;

    var dashHourBrush = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 1;
    var secondHandX = centerX + 40 * cos(dateTime.second * 6 * pi / 180);
    var secondHandY = centerX + 40 * sin(dateTime.second * 6 * pi / 180);

    var minHandX = centerX + 30 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 30 * sin(dateTime.minute * 6 * pi / 180);

    var hourHandX = centerX + 20 * cos(dateTime.hour * 30 * pi / 180);
    var hourHandY = centerX + 20 * sin(dateTime.hour * 30 * pi / 180);

    // canvas.drawCircle(center, radius - 10, fillBrush);
    // canvas.drawCircle(center, radius - 10, outlineBrush);

    // canvas.drawCircle(center, radius - 0, fillBrush);
    // canvas.drawCircle(center, radius - 10, outlineBrush);
    // canvas.drawCircle(
    //     center, 65, centerFillBrush..color = Colors.grey.withOpacity(.1));
    // canvas.drawCircle(center, 50, centerFillBrush..color = Colors.white);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secHandBrush);

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);
    canvas.drawCircle(center, 3, centerFillBrush..color = Colors.grey);

    var outerCircleRadius = radius;
    var innerCircleRadiusHour = radius - 6;
    // for (double i = 0; i < 360; i += 24) {
    //   var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
    //   var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

    //   var x2 = centerX + innerCircleRadiusHour * cos(i * pi / 180);
    //   var y2 = centerX + innerCircleRadiusHour * sin(i * pi / 180);

    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }

    var innerCircleRadius = radius - 4;
    for (double i = 0; i < 360; i += 6) {
      if (i % 24 == 0) {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadiusHour * cos(i * pi / 180);
        var y2 = centerX + innerCircleRadiusHour * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashHourBrush);
      } else {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
        var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      }
    }
  }
}
