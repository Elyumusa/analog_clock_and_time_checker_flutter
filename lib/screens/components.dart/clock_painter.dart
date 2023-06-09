import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;
  final BuildContext context;
  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    Paint minuteLinePaint = Paint()
      ..color = kAccentLightColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    if (Theme.of(context).brightness == Brightness.dark) {
      minuteLinePaint = Paint()
        ..color = kAccentDarkColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10;
    }
    //Minute Calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);
    //minute Line
    canvas.drawLine(center, Offset(minX, minY), minuteLinePaint);

    //Hour Calculation
    //dateTime.hour * 30 because 360/12=30
    //dateTime.minute*0.5 each minute we want to turn our hour line alitle
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    //hour Line
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Theme.of(context).colorScheme.secondary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 10);
    //second Calculation
    //size.width * 0.4 defines our line height
    //dateTime.second*6 because 360/60=6, because 360 degrees is 60 seconds
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);
    //second Line
    canvas.drawLine(center, Offset(secondX, secondY),
        Paint()..color = Theme.of(context).primaryColor);

    //Center dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color!;
    canvas.drawCircle(center, 24, Paint()..color = Colors.grey);
    canvas.drawCircle(
        center, 23, Paint()..color = Theme.of(context).colorScheme.background);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
