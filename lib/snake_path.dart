import 'package:flutter/material.dart';
abstract class SnakePath {
   SnakePath(this.start, this.end);

  Offset start;

  final Offset end;

  double getLength();

  Path toCompletePath();

  Path toInCompletePath(double remainingLength);
}