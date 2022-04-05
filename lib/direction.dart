class DirectionFactory {
   Direction createWithKeyLabel(String keyLabel) {
    switch (keyLabel) {
      case "Arrow Right":
        return Direction.right;
      case "Arrow Left":
        return Direction.left;
      case "Arrow Up":
        return Direction.up;
      case "Arrow Down":
        return Direction.down;
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

class InvalidKeyException implements Exception {}