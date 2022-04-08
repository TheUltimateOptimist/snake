import 'package:flutter/material.dart';
import 'package:snake/snake.dart';

class SnakePainter extends CustomPainter {
  SnakePainter(this.snake);

  final Snake snake;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(snake.toPath(), snake.getPaint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
