import 'package:snake/position.dart';

class GameBoard {
  final int verticalSquares;
  final int horizontalSquares;
  final int sideLength;
  final BoardPosition snackPosition;

  GameBoard({
    this.verticalSquares = 15,
    this.horizontalSquares = 15,
    this.sideLength = 15,
    required this.snackPosition
  });

  int get width => horizontalSquares*sideLength;

  int get height => verticalSquares*sideLength;

  void shuffleSnackPosition(){
    //TODO: implement shuffleSnackPosition
  }


}