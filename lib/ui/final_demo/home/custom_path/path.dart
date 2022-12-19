import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
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

class TestClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width * 1.2496500, size.height * 1.1893714)
    ..cubicTo(
      size.width * 0.2515333,
      size.height * 0.3940714,
      size.width * 0.5415833,
      size.height * 0.1788429,
      size.width * 0.5422333,
      size.height * 0.3680429,
    )
    ..quadraticBezierTo(
      size.width * 0.5418250,
      size.height * 0.5573571,
      size.width * 0.5438833,
      size.height * 0.5721714,
    )
    ..lineTo(size.width * 0.2491667, size.height * 0.5714286)
    ..quadraticBezierTo(
      size.width * 0.2524667,
      size.height * 0.3497429,
      size.width * 0.2496500,
      size.height * 0.1893714,
    )
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
