class randomEventManager {
  int randomEventCount = 9;
  int randomEasyEventCount = 4;
  String resultString, shipEventString;
  int gridX, gridY;
  randomEventManager() {
  }

  void generateRandomEventNumber() {
    if (turn > 150) {
      boolean hasShip = false;
      for (int i=0; i<3; i++) {
        if (ships[i].isBought == true) {
          hasShip = true;
        }
      }

      if (hasShip == true) {        
        eventNumber = int(random(1, randomEventCount+1));
      } else {        
        eventNumber = int(random(1, randomEventCount));
      }
    } else {
      eventNumber = int(random(1, randomEasyEventCount+1));
    }
  }

  void runEvent() {
    // 1-2 Gain Resources
    // 3-4 Lose Resources
    // 5 Gain Building
    // 6 Lose Building
    // 7 Gain All of a Resource
    // 8 Lose All of a Resource
    // 9 Take Ship Damage
    if (eventNumber == 1) {
      minerals += 100;
      resultString = "Gained Materials";
    } else if (eventNumber == 2) {
      energy += 100; 
      resultString = "Gained Energy";
    } else if (eventNumber == 3) {
      if (minerals > 100);
      minerals -= 100;
      resultString = "Lost Materials";
    } else if (eventNumber == 4) {
      if (energy > 100) {
        minerals -= 100;
      }
      resultString = "Lost Energy";
    } else if (eventNumber == 5) {
      freeBuilding = true;
      resultString = "Free Building";
    } else if (eventNumber == 6) {
      resoMan.destroyRandomBuilding();
      resultString = "Building Destroyed";
    } else if (eventNumber == 7) {
      minerals = mineralMax;
      energy = energyMax;
      resultString = "Gained Max Resources";
    } else if (eventNumber == 8) {
      minerals = 0;
      energy = 0;
      resultString = "Lost All Resources";
    } else if (eventNumber == 9) {

      boolean shipFound = false;
      int roll = int(random(0, 3));

      while (shipFound == false) {
        if (ships[roll].isBought == false) {
          roll = int(random(0, 3));
        } else {
          shipFound = true;
        }
      }

      ships[roll].health = ships[roll].health - (ships[roll].health/2);
      resultString = "Ship Damaged";
    }
    displayRandomEventNotification = true;
  }

  void runShipEvent(int result) {
    if (result == 1) {
      int roll = int(random(1, 3));
      if (roll == 1) {
        minerals = mineralMax;
        shipEventString = "Gained Materials";
      } else if (roll == 2) {
        energy = energyMax; 
        shipEventString = "Gained Energy";
      }
    } else if (result == 2) {
      freeBuilding = true;
      shipEventString = "Free Building";
    } else if (result == 3) {
      relics++;
      shipEventString = "Relic Found";
    }
    displayShipEventNotification = true;
  }

  void displayNotification() {
    rectMode(CENTER);
    fill(WHITE);
    rect(width/2, height/2, width*2/3, width/6);
    rectMode(CORNER);
    rect(width/6, width*5/12, width/6, width/6);
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      fill(GREY);
    } else {
      fill(WHITE);
    }
    rect(width*2/3, width*5/12, width/6, width/6);
    textAlign(CENTER, CENTER);
    textSize(width*8/75);
    fill(BLACK);
    text("OK", width*3/4, width*59/120);
    textAlign(LEFT, CENTER);
    textSize(width/30);
    text("RANDOM EVENT!", width*205/600, width*270/600);
    text("Result: " + resultString, width*205/600, width*330/600);
  }

  void displayShipNotification() {
    rectMode(CENTER);
    fill(WHITE);
    rect(width/2, height/2, width*2/3, width/6);
    rectMode(CORNER);
    rect(width/6, width*5/12, width/6, width/6);
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      fill(GREY);
    } else {
      fill(WHITE);
    }
    rect(width*2/3, width*5/12, width/6, width/6);
    textAlign(CENTER, CENTER);
    textSize(width*8/75);
    fill(BLACK);
    text("OK", width*3/4, width*59/120);
    textAlign(LEFT, CENTER);
    textSize(width/30);
    text("MISSION SUCCESS!", width*205/600, width*270/600);
    text("Result:", width*205/600, width*330/600);
  }

  void clickRandomEventNotification() {
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      displayRandomEventNotification = false;
    }
  }

  void clickShipNotification() {
    if (mouseX > width*2/3 && mouseX < width*5/6 && mouseY > 250 && mouseY < width/6) {
      displayShipEventNotification = false;
    }
  }

  void debug_TestEvents() {
    generateRandomEventNumber();
    runEvent();
  }
}