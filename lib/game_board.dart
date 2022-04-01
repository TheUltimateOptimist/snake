import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class InvalidKeyException implements Exception{

}

class DirectionFactory{
  static Direction fromKeyLabel(String keyLabel){
    switch(keyLabel){
      case "Arrow Right": return Direction.right;
      case "Arrow Left": return Direction.left;
      case "Arrow Up": return Direction.up;
      case "Arrow Down": return Direction.down;
    }
    throw InvalidKeyException();
  }
}

enum Direction {
  left,
  right,
  up,
  down,
}

class GameBoard {
  int velocity;
  int width;
  int height;
  int leftDistance;
  int bottomDistance;
  Direction direction;

  GameBoard({
    this.width = 200,
    this.height = 200,
    this.velocity = 1,
    this.leftDistance = 100,
    this.bottomDistance = 100,
    this.direction = Direction.right,
  });

  void move() {
    switch (direction) {
      case Direction.left:
        leftDistance -= velocity;
        break;
      case Direction.right:
        leftDistance += velocity;
        break;
      case Direction.up:
        bottomDistance += velocity;
        break;
      case Direction.down:
        bottomDistance -= velocity;
        break;
    }
  }

  bool hasTouchedBorder() {
    if (bottomDistance >= height) return true;
    if (leftDistance >= width) return true;
    if (leftDistance <= 0) return true;
    if (bottomDistance <= 0) return true;
    return false;
  }


}
