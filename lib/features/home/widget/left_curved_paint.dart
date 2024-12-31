import 'package:flutter/material.dart';

class LeftCurvedPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();

    // Start from the right and curve towards the left
    path_0.moveTo(size.width, size.height * 0.004526989);  // Start from the right
    path_0.lineTo(size.width * 0.0009308, size.height * 0.004526989);  // Go to left edge
    path_0.cubicTo(
      size.width * -0.008220, 
      size.height * 0.1467085, 
      size.width * 0.0503585, 
      size.height * 0.2618734, 
      size.width * 0.1380943, 
      size.height * 0.3798356);
    path_0.cubicTo(
      size.width * 0.3379686, 
      size.height * 0.6485691, 
      size.width * 0.2767044, 
      size.height * 0.8447447, 
      size.width * 0.1868491, 
      size.height * 0.9984468);
    path_0.lineTo(size.width, size.height * 0.9984468);  // End at the right edge
    path_0.lineTo(size.width, size.height * 0.004526989);  // Close path to the right
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff15301F).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomToTopCurvedPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();

    // Start from the bottom and curve upwards
    path_0.moveTo(size.width * 0.0009308, size.height);  // Start at bottom left
    path_0.lineTo(size.width * 0.9990692, size.height);  // Move to bottom right
    path_0.cubicTo(
      size.width * 0.0503585, 
      size.height * 0.8532915, 
      size.width * 0.1380943, 
      size.height * 0.7381266, 
      size.width * 0.2619057, 
      size.height * 0.6201644);  // Create upward curve
    path_0.cubicTo(
      size.width * 0.7232956, 
      size.height * 0.1552553, 
      size.width * 0.6620314, 
      size.height * 0.3514309, 
      size.width * 0.8131509, 
      size.height * 0.00155316);  // Continuing curve upwards
    path_0.lineTo(size.width * 0.0009308, size.height * 0.00155316);  // Return to the bottom left
    path_0.lineTo(size.width * 0.0009308, size.height);  // Close the path at the bottom left
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff15301F).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
