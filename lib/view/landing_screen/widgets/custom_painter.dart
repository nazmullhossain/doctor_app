import 'package:flutter/material.dart';

class UpsideDownTriangleWidget extends StatelessWidget {
  const UpsideDownTriangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * 3.1415926535897932 / 180, // Rotate 180 degrees (upside-down)
      child: Center(
        child: CustomPaint(
          painter: UpsideDownTrianglePainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class UpsideDownTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width /2, 0) // Starting point at the top-center
      ..lineTo(0, size.height * 0.25) // Line to the reduced bottom-left corner
      ..lineTo(size.width, size.height * 0.25) // Line to the reduced bottom-right corner
      ..close(); // Connects the last point to the starting point to form a closed shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

