import 'package:flutter/material.dart';
abstract class SnakePath {
   SnakePath(this.start, this.end);

  final Offset start;

  Offset end;

  double getLength();

  Path toCompletePath();

  Path toInCompletePath(double remainingLength);
}