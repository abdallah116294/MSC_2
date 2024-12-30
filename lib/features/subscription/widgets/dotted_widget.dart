import 'dart:math';

import 'package:flutter/material.dart';
import 'package:msc_2/core/utils/app_color.dart';

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple // Border color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    const dotSpacing = 4.0; // Space between dots
    const dotSize = 2.0; // Size of each dot

    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(12), // Match the container border radius
      ));

    final dashPath = Path();
    double distance = 0.0;

    // Measure the total path length
    final totalLength = path.computeMetrics().fold<double>(0.0, (sum, metric) {
      return sum + metric.length;
    });

    // Add dots along the path
    for (var metric in path.computeMetrics()) {
      while (distance < metric.length) {
        dashPath.addOval(Rect.fromCircle(
          center: metric.getTangentForOffset(distance)!.position,
          radius: dotSize,
        ));
        distance += dotSpacing + dotSize * 2;
      }
      distance -= metric.length; // Reset for next path segment
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundedDottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final radius = size.width / 2; // Radius of the circle
    final center = Offset(size.width / 2, size.height / 2);

    const dotRadius = 4.0; // Radius of each dot
    const totalDots = 40; // Total number of dots in the circle

    for (int i = 0; i < totalDots; i++) {
      // Angle for each dot
      final angle = (2 * 3.141592653589793 / totalDots) * i;

      // Position of the dot
      final dx = center.dx + radius * cos(angle);
      final dy = center.dy + radius * sin(angle);

      // Draw the dot
      canvas.drawCircle(Offset(dx, dy), dotRadius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CircularDashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.grey.withOpacity(.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 10;
    const dashSpace = 5;

    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    // Total circumference of the circle
    final circumference = 2 * 3.141592653589793 * radius;

    // Angle between each dash
    final dashAngle = dashWidth / radius;
    final spaceAngle = dashSpace / radius;

    double currentAngle = 0;

    while (currentAngle < 2 * 3.141592653589793) {
      final startAngle = currentAngle;
      final sweepAngle = dashAngle;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );

      currentAngle += dashAngle + spaceAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.grey.withOpacity(.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 4;
    const dashSpace = 4;
    double startX = 0;

    // Draw top border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    double startY = 0;

    // Draw right border
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width, startY),
        Offset(size.width, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    startX = size.width;
    startY = size.height;

    // Draw bottom border
    while (startX > 0) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX - dashWidth, size.height),
        paint,
      );
      startX -= dashWidth + dashSpace;
    }

    startY = size.height;

    // Draw left border
    while (startY > 0) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY - dashWidth),
        paint,
      );
      startY -= dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
