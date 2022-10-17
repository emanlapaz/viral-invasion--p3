// countdown timer class//

class CountDownTimer {

  //properties//
  private int beginCount;
  private int duration;
  private int timeInterval;

  //default constructors//
  CountDownTimer (int timeInterval) {
    this.duration = timeInterval;
  }

  //getters//
  public int getbeginCount() {
    return this.beginCount;
  }

  public int getduration() {
    return this.duration;
  }

  public int gettimeInterval() {
    return this.timeInterval;
  }

  //methods//
  void begin() {
    beginCount = millis();// set timer to milliseconds//
  }

  boolean complete() { // boolean for completed timer//
    int timeRemaining = millis()- beginCount;
    if (timeRemaining > duration) {
      return true;
    } else {
      return false;
    }
  }
}
