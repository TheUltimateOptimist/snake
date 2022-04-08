import 'package:flutter/material.dart';
import 'package:snake/direction.dart';

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
}