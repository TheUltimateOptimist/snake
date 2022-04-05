import 'package:flutter/cupertino.dart';
import 'package:snake/direction.dart';

class Game{
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