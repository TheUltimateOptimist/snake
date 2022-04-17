class Pacer{
  Pacer({this.velocity = 10, this.elapsed = Duration.zero});

  Duration elapsed;

  int velocity;

  int _distanceTravelled = 0;

  int getNextDistance(){
    final appropriateDistance = elapsed.inSeconds*velocity;
    final nextDistance = appropriateDistance - _distanceTravelled;
    _distanceTravelled+=nextDistance;
    return nextDistance;
  }
}