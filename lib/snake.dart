import 'package:flutter/material.dart';

import 'package:snake/direction.dart';
import 'package:snake/offset_extension.dart';
import 'package:snake/snake_line.dart';
import 'package:snake/snake_path.dart';


class NoSubPathsLeftException implements Exception{
}

class Snake {
  Snake(
    this.subPaths,
    this.thickness, {
    this.direction = Direction.right,
    this.velocity = 50,
    this.length = 30,
    this.lengthIncrement = 10,
    this.color = Colors.white,
  });

  final List<SnakePath> subPaths;
  final Color color;
  final double thickness;

  Direction direction;

  double velocity;  //in pixels per second

  double length;

  double lengthIncrement;

  double _distanceTravelled = 0;

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

  void moveForward(Duration elapsed) {
    final lastPath = subPaths.last;
    final forwardDistance = _getDistanceToMoveForward(elapsed);
    final newStartOffset = lastPath.start.moveForward(forwardDistance, direction);
    if(lastPath is SnakeLine){
      lastPath.start = newStartOffset;
    }
    else{
      subPaths.add(SnakeLine(newStartOffset, lastPath.start));
    }
    _distanceTravelled+=forwardDistance;
  }

  void eatFruit(){
    length+=lengthIncrement;
  }

  double _getDistanceToMoveForward(Duration elapsed){
    return (elapsed.inMilliseconds*velocity)/1000 - _distanceTravelled;
  }
}
