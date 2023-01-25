import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final dateTime;

  ClockPainter(this.dateTime);

  //60 sec 1 sec- degree

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()
      ..color = const Color(0xFF444974)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;
    var shadow = Paint()
      // ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;
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
    var secondHandX = centerX + size.height/2.5 * cos(dateTime.second * 6 * pi / 180);
    var secondHandY = centerX + size.height/2.5  * sin(dateTime.second * 6 * pi / 180);

    var minHandX = centerX +  size.height/3.2 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + size.height/3.2 * sin(dateTime.minute * 6 * pi / 180);

    var hourHandX = centerX + size.height/5 * cos(dateTime.hour * 30 * pi / 180);
    var hourHandY = centerX + size.height/5 * sin(dateTime.hour * 30 * pi / 180);

    // canvas.drawCircle(center, radius - 10, fillBrush);
    // canvas.drawCircle(center, radius - 10, outlineBrush);

    // canvas.drawCircle(center, radius - 0, fillBrush);
    // canvas.drawCircle(center, radius - 10, outlineBrush);
    // canvas.drawCircle(
    //     center, 65, centerFillBrush..color = Colors.grey.withOpacity(.1));
    // canvas.drawCircle(center, 50, centerFillBrush..color = Colors.white);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secHandBrush);

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush..color=Colors.grey);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush..color=Colors.grey);
    canvas.drawCircle(center, 3, centerFillBrush..color=Colors.blueGrey.shade200);
    // const progress = .97;

    const startAngle = pi / 2;
    // const sweepAngle = -2 * pi * progress;
    // const breakAngle = -2 * pi * .1;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 15),
        startAngle, 360, false, fillBrush..color = Colors.grey.shade100);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 15),
    //     startAngle - .17, sweepAngle, false, fillBrush..color = Colors.green);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 15),
    //     -pi / 2, breakAngle + .09, false, shadow..color = Colors.red);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 20),
    //     startAngle, sweepAngle, false, fillBrush..color = Colors.red);
    var outerCircleRadius = radius;
    var innerCircleRadiusHour = radius - 5;
    // for (double i = 0; i < 360; i += 24) {
    //   var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
    //   var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

    //   var x2 = centerX + innerCircleRadiusHour * cos(i * pi / 180);
    //   var y2 = centerX + innerCircleRadiusHour * sin(i * pi / 180);

    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }

    var innerCircleRadius = radius - 4;

    for (double i = 0; i < 360; i += 6) {
      if (i % 30 == 0) {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadiusHour * cos(i * pi / 180);
        var y2 = centerX + innerCircleRadiusHour * sin(i * pi / 180);
        canvas.drawLine(
            Offset(x1, y1), Offset(x2, y2), dashHourBrush..strokeWidth = 1);
      } else {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerX + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
        var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
        canvas.drawLine(
            Offset(x1, y1), Offset(x2, y2), dashBrush..strokeWidth = 1);
      }
    }
  }
}
