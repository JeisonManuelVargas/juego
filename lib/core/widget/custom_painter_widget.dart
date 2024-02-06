import 'package:adivinanza/core/util/app_color.dart';
import 'package:flutter/cupertino.dart';

class CustomPainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    lapiz.color = AppColors().primaryColor;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();

    //dibujar con el path y el lapiz

    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.33,
      size.width * 0.10,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.27,
      size.width * 0.20,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.33,
      size.width * 0.30,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.27,
      size.width * 0.40,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.33,
      size.width * 0.50,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.27,
      size.width * 0.60,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.33,
      size.width * 0.70,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.33,
      size.width * 0.70,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.27,
      size.width * 0.80,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.33,
      size.width * 0.90,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.27,
      size.width,
      size.height * 0.3,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
