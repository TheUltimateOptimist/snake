import 'package:flutter/cupertino.dart';

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
}
