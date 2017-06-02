class randomEventManager {
  int randomEventCount = 10;
  int randomEasyEventCount = 5;
  randomEventManager() {
  }

  void generateRandomEvent() {
    int eventNumber = generateRandomEventNumber();
    
    
    
  }

  int generateRandomEventNumber() {
   if (turn > 150) {
    return int(random(randomEventCount+1));
   } else {
     return int(random(randomEasyEventCount+1));
   }
  }

}