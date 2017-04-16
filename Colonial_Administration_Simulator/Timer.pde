class timer {

  int time = millis();

  timer() {
  }

  void timerProcess() {
    if (millis() > time + 1000) {
      time = millis();
    }
  }
}