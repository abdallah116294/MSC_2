import 'package:flutter/material.dart';

class RightCurvedPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.000001727409, size.height * 0.004526989);
    path_0.lineTo(size.width * 0.9990692, size.height * 0.004526989);
    path_0.cubicTo(
        size.width * 1.008220,
        size.height * 0.1467085,
        size.width * 0.9496415,
        size.height * 0.2618734,
        size.width * 0.8619057,
        size.height * 0.3798356);
    path_0.cubicTo(
        size.width * 0.6620314,
        size.height * 0.6485691,
        size.width * 0.7232956,
        size.height * 0.8447447,
        size.width * 0.8131509,
        size.height * 0.9984468);
    path_0.lineTo(size.width * -0.000001727409, size.height * 0.9984468);
    path_0.lineTo(size.width * -0.000001727409, size.height * 0.004526989);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff15301F).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
