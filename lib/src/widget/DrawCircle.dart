import 'package:flutter/material.dart';

class DrawCircle extends CustomPainter {
  Paint _paint;

  DrawCircle() {
    _paint = Paint();
    _paint.color = Colors.orange[100];
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(206, 0), 228.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
