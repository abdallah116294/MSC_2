import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class Substract2PaintWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5796557, size.height * 0.4108957);
    path_0.cubicTo(
        size.width * 0.7822586,
        size.height * 0.2909697,
        size.width * 0.9887443,
        size.height * 0.1580340,
        size.width * 0.9989257,
        size.height * 0.004526989);
    path_0.lineTo(size.width * 0.6387729, size.height * 0.004526989);
    path_0.cubicTo(
        size.width * 0.5766243,
        size.height * 0.09127500,
        size.width * 0.4595871,
        size.height * 0.2147218,
        size.width * 0.2529329,
        size.height * 0.3824239);
    path_0.cubicTo(
        size.width * -0.03139543,
        size.height * 0.6131596,
        size.width * -0.02063886,
        size.height * 0.8364787,
        size.width * 0.07142243,
        size.height * 0.9984468);
    path_0.lineTo(size.width * 0.4151686, size.height * 0.9984468);
    path_0.cubicTo(
        size.width * 0.2329757,
        size.height * 0.8571277,
        size.width * 0.1264026,
        size.height * 0.6791862,
        size.width * 0.5796557,
        size.height * 0.4108957);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff2BBE9B).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
