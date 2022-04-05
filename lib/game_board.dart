class GameBoard {
  final int verticalSquares;
  final int horizontalSquares;
  final int sideLength;

  GameBoard({
    this.verticalSquares = 15,
    this.horizontalSquares = 15,
    this.sideLength = 15,
  });

  int get width => horizontalSquares*sideLength;

  int get height => verticalSquares*sideLength;
}