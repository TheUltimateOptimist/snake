import 'package:flutter/material.dart';

import 'package:snake/direction.dart';
import 'package:snake/snake_path.dart';

class Snake {
  Snake(this.subPaths, this.thickness,{this.direction = Direction.right, this.color = Colors.white});

  final List<SnakePath> subPaths;
  final Color color;
  final double thickness;

  Direction direction;

  Path toPath() {
    throw UnimplementedError();
  }

  Paint getPaint() {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;
  }

  void moveForward() {
    throw UnimplementedError();
  }
}