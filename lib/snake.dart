import 'package:flutter/material.dart';

import 'package:snake/direction.dart';
import 'package:snake/snake_path.dart';


class NoSubPathsLeftException implements Exception{
}

class Snake {
  Snake(
    this.subPaths,
    this.thickness, {
    this.direction = Direction.right,
    this.length = 30,
    this.color = Colors.white,
  });

  final List<SnakePath> subPaths;
  final Color color;
  final double thickness;

  Direction direction;

  double length;

  Path toPath(){
    double remainingLength = length;
    Path path = Path();
    for(var subPath in subPaths.reversed){
      final subPathLength = subPath.getLength();
      if(remainingLength > subPathLength){
        path.addPath(subPath.toCompletePath(), Offset.zero);
        remainingLength -= subPathLength;
      }
      else{
        path.addPath(subPath.toInCompletePath(remainingLength), Offset.zero);
        return path;
      }
    }
    throw NoSubPathsLeftException();
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
