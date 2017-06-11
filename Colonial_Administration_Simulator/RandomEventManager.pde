class randomEventManager {
  int randomEventCount = 9;
  int randomEasyEventCount = 4;
  String stringOne, stringTwo;
  randomEventManager() {
  }

  int generateRandomEventNumber() {
    if (turn > 150) {
      return int(random(1, randomEventCount+1));
    } else {
      return int(random(1, randomEasyEventCount+1));
    }
  }

  void runEvent() {
    int eventNumber = generateRandomEventNumber();
    // 1-2 Gain Resources
    // 3-4 Lose Resources
    // 5 Gain Building
    // 6 Lose Building
    // 7 Gain All of a Resource
    // 8 Lose All of a Resource
    // 9 Take Ship Damage
    if (eventNumber == 1) {
    } else if (eventNumber == 2) {
    } else if (eventNumber == 3) {
    } else if (eventNumber == 4) {
    } else if (eventNumber == 5) {
    } else if (eventNumber == 6) {
    } else if (eventNumber == 7) {
    } else if (eventNumber == 8) {
    } else if (eventNumber == 9) {
    }
  }

  void runShipEvent(int result) {
    if (result == 1) {
    } else if (result == 2) {
    } else if (result == 3) {
    }
  }

  void displayNotification() {
  }
  
  void displayShipNotification() {
  }
}