import 'package:flutter/material.dart';

import 'package:snake/direction.dart';
import 'package:snake/game_board.dart';

extension OffsetExtension on Offset{
  Offset moveForward(double distance, Direction direction){
    switch(direction){
      case Direction.left:
        return Offset(dx - distance, dy);
      case Direction.right:
        return Offset(dx + distance, dy);
      case Direction.up:
       return Offset(dx, dy - distance);
      case Direction.down:
        return Offset(dx, dy + distance);
        }
    }

  bool isOutOfBoard(GameBoard gameBoard) {
    final boxHalf = gameBoard.sideLength/2;
    if (dx > gameBoard.width - boxHalf) return true;
    if (dy > gameBoard.height - boxHalf) return true;
    if (dx < boxHalf) return true;
    if (dy < boxHalf) return true;
    return false;
  }
}