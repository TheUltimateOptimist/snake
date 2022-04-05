import 'game_board.dart';

class BoardPosition {
  BoardPosition(
    this.leftDistance,
    this.bottomDistance,
    this.board,
  );

  int leftDistance;

  int bottomDistance;

  final GameBoard board;

  bool isNotInBoard() {
    if (bottomDistance >= board.height) return true;
    if (leftDistance >= board.width) return true;
    if (leftDistance <= 0) return true;
    if (bottomDistance <= 0) return true;
    return false;
  }
}
