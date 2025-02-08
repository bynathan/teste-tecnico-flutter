import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors_constants.dart';

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
    ..color = AppColors.white
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke;

    const double dashWidth = 4, dashSpace = 4;
    double startX = 0;
    double y = size.height;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}