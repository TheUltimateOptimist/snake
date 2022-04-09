import 'package:flutter/cupertino.dart';
import 'package:snake/direction.dart';
import 'package:snake/snake_line.dart';
import 'package:snake/snake_path.dart';
import 'package:snake/offset_extension.dart';

class GameBoard {
  final int verticalSquares;
  final int horizontalSquares;
  final int sideLength;
  late final Offset snackPosition;

  GameBoard({
    this.verticalSquares = 15,
    this.horizontalSquares = 15,
    this.sideLength = 15,
  }) {
    snackPosition = Offset(sideLength / 2, sideLength / 2);
  }

  int get width => horizontalSquares * sideLength;

  int get height => verticalSquares * sideLength;

  void shuffleSnackPosition() {
    //TODO: implement shuffleSnackPosition
  }

  SnakePath getInitialSnakePath(double length){
    Offset center = Offset((horizontalSquares/2).floorToDouble() + sideLength/2, (verticalSquares/2).floorToDouble() + sideLength/2);
    Offset end = center.moveForward(length, Direction.left);
    return SnakeLine(center, end);
  }
}
