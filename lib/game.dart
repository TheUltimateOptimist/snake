import 'package:flutter/cupertino.dart';
import 'package:snake/direction.dart';
import 'package:snake/game_board.dart';

import 'snake.dart';

class Game{
  Game(this.gameBoard, this.snake);

  factory Game.defaultOption(){
    GameBoard gameBoard = GameBoard();
    final thickness = gameBoard.sideLength.toDouble();
    Snake snake = Snake([gameBoard.getInitialSnakePath(2*thickness)], thickness);
    return Game(gameBoard, snake);
  }

  final GameBoard gameBoard;

  final Snake snake;
  void changeDirection(String keyLabel){
    final direction = DirectionFactory().createWithKeyLabel(keyLabel);
    //TODO: make direction change
  }

  bool canMoveForward(){
    //TODO: implement canMoveForward
    throw UnimplementedError();
  }

  int getBoardWidth(){
    //TODO: implement getBoardWidth
    throw UnimplementedError();
  }

  int getBoardHeight(){
    //TODO: implement getBoardHeight
    throw UnimplementedError();
  }

  List<Container> getContainers(){
    //TODO: implement getContainers
    throw UnimplementedError();
  }

  void moveForward(Duration elapsed){
    //TODO: implement moving forward
  }
}