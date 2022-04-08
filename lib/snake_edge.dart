import 'dart:math';

import 'package:flutter/material.dart';

import 'package:snake/direction_change.dart';
import 'package:snake/snake_path.dart';

class SnakeEdge extends SnakePath {
  const SnakeEdge(Offset start, Offset end, this.directionChange)
      : super(start, end);

  final DirectionChange directionChange;

  @override
  double getLength() {
    return 2 * pi * _getVerticalDistance() / 4;
  }

  double _getVerticalDistance() {
    return (start.dy - end.dy).abs();
  }

  Rect _getRectangle(Offset center) {
    final sideLength = 2 * _getVerticalDistance();
    return Rect.fromCenter(
        center: center, width: sideLength, height: sideLength);
  }

  Path _getPath(Offset center, double startAngle,
      [double sweepAngle = pi / 2]) {
    return Path()..addArc(_getRectangle(center), startAngle, sweepAngle);
  }

  @override
  Path toCompletePath() {
    switch (directionChange) {
      case DirectionChange.rightUp:
        return _getPath(Offset(start.dx, end.dy), 0);
      case DirectionChange.rightDown:
        return _getPath(Offset(start.dx, end.dy), -pi / 2);
      case DirectionChange.downLeft:
        return _getPath(Offset(end.dx, start.dy), 0);
      case DirectionChange.downRight:
        return _getPath(Offset(end.dx, start.dy), pi / 2);
      case DirectionChange.leftUp:
        return _getPath(Offset(start.dx, end.dy), pi / 2);
      case DirectionChange.leftDown:
        return _getPath(Offset(start.dx, end.dy), pi);
      case DirectionChange.topLeft:
        return _getPath(Offset(end.dx, start.dy), -pi / 2);
      case DirectionChange.topRight:
        return _getPath(Offset(end.dx, start.dy), pi);
    }
  }

  @override
  Path toInCompletePath(double remainingLength) {
    final sweepAngle = pi / 2 * (remainingLength / getLength());
    switch (directionChange) {
      case DirectionChange.rightUp:
        return _getPath(
            Offset(start.dx, end.dy), pi / 2 - sweepAngle, sweepAngle);
      case DirectionChange.rightDown:
        return _getPath(Offset(start.dx, end.dy), -pi / 2, sweepAngle);
      case DirectionChange.downLeft:
        return _getPath(Offset(end.dx, start.dy), 0, sweepAngle);
      case DirectionChange.downRight:
        return _getPath(Offset(end.dx, start.dy), pi - sweepAngle, sweepAngle);
      case DirectionChange.leftUp:
        return _getPath(Offset(start.dx, end.dy), pi / 2, sweepAngle);
      case DirectionChange.leftDown:
        return _getPath(
            Offset(start.dx, end.dy), 3 / 2 * pi - sweepAngle, sweepAngle);
      case DirectionChange.topLeft:
        return _getPath(Offset(end.dx, start.dy), -sweepAngle, sweepAngle);
      case DirectionChange.topRight:
        return _getPath(Offset(end.dx, start.dy), pi, sweepAngle);
    }
  }
}