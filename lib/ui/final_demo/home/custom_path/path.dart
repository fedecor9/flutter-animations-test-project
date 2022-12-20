import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color? color;

  RPSCustomPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint0 = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final Path path0 = Path()
      ..moveTo(0, 0)
      ..cubicTo(
        0,
        size.height * 0.3511143,
        size.width,
        0,
        size.width,
        size.height * 0.284000,
      )
      ..quadraticBezierTo(size.width, size.height, size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
