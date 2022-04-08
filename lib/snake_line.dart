import 'package:flutter/material.dart';

import 'package:snake/snake_path.dart';

class SnakeLine extends SnakePath{
   SnakeLine(Offset start, Offset end) : super(start, end);

  @override
  double getLength() {
    return (start.dx - end.dx).abs() + (start.dy - end.dy).abs();
  }

  @override
  Path toCompletePath() {
    return Path()..moveTo(start.dx, start.dy)..lineTo(end.dx, end.dy);
  }

  @override
  Path toInCompletePath(double remainingLength) {
    final vectorX = end.dx - start.dx;
    final vectorY = end.dy - start.dy;
    return Path()..moveTo(start.dx, start.dy)..lineTo(start.dx + vectorX*remainingLength, start.dy + vectorY*remainingLength);
  }
}