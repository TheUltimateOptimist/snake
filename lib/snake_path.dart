import 'package:flutter/material.dart';
abstract class SnakePath {
  const SnakePath(this.start, this.end);

  final Offset start;

  final Offset end;

  double getLength();

  Path toCompletePath();

  Path toInCompletePath(double remainingLength);
}