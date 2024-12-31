import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class SubstractPaintWidget extends CustomClipper<Path> {
  @override
  ui.Path getClip(ui.Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5720457, size.height * 0.4134840);
    path_0.cubicTo(
        size.width * 0.7757871,
        size.height * 0.2928846,
        size.width * 0.9834543,
        size.height * 0.1591287,
        size.width * 0.9914686,
        size.height * 0.004526989);
    path_0.lineTo(size.width * 0.6330086, size.height * 0.004526989);
    path_0.cubicTo(
        size.width * 0.5713443,
        size.height * 0.09140160,
        size.width * 0.4540414,
        size.height * 0.2156351,
        size.width * 0.2453229,
        size.height * 0.3850122);
    path_0.cubicTo(
        size.width * -0.03749357,
        size.height * 0.6145213,
        size.width * -0.02835457,
        size.height * 0.8366968,
        size.width * 0.06235143,
        size.height * 0.9984468);
    path_0.lineTo(size.width * 0.4042357, size.height * 0.9984468);
    path_0.cubicTo(
        size.width * 0.2240871,
        size.height * 0.8575426,
        size.width * 0.1215556,
        size.height * 0.6801383,
        size.width * 0.5720457,
        size.height * 0.4134840);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff287B67).withOpacity(1.0);
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) => false;
}
