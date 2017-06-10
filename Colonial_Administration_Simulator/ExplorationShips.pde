class explorationShips {
  boolean isBought, isHome;
  int experience, experienceNeeded, shipLevel;
  int health, maxHealth;
  int percentChance;
  int reqPrice;
  int[] requiredXPArray = {100, 300, 500, 750, 1000, 99999999};
  String[] shipNames = {"JDS Yamato", "HIRMS Sputnik III", "USS Enterprise"};
  explorationShips (int i) {
    shipLevel = 0;
    isBought = false;
    isHome = true;
    if (i == 0) {
      reqPrice = 125;
    } else if (i == 1) {
      reqPrice = 300;
    } else if (i == 2) {
      reqPrice = 500;
    }
  }

  void shipUpdate() {
    shipLevelUpdate();
    levelUpShip();
  }

  void shipLevelUpdate() {
    experienceNeeded = requiredXPArray[shipLevel];
    if (shipLevel == 0) {
      maxHealth = 0;
      percentChance = 0;
    } else if (shipLevel == 1) {      
      maxHealth = 10;
      percentChance = 10;
    } else if (shipLevel == 2) {      
      maxHealth = 25;
      percentChance = 25;
      experienceNeeded = 500;
    } else if (shipLevel == 3) {      
      maxHealth = 60;
      percentChance = 50;
    } else if (shipLevel == 4) {      
      maxHealth = 80;
      percentChance = 70;
      experienceNeeded = 1000;
    } else if (shipLevel == 5) {      
      maxHealth = 100;
      percentChance = 90;
    }
  }

  void levelUpShip() {
    if (experience >= experienceNeeded) {
      shipLevel++; 
      experience = 0;
    }
    if (shipLevel >= 5) {
      shipLevel = 5;
      experience = 0;
    }
  }

  boolean canBuyShip() {
    if (energy >= reqPrice) {
      return true;
    } else {
      return false;
    }
  }

  void buyShip() {
    energy = energy - reqPrice;
    isBought = true;
  }

  void displayShipInfo() {
    // Display Info
    textAlign(LEFT, CENTER);
    textSize(width*2/75);
    text(shipNames[selectedShip], width*4/15, width*8/15);

    // Level + Experience
    fill(WHITE);
    rect(width*4/15, width*7/12, width*37/60, width/30);
    fill(GREEN);
    rect(width*4/15, width*7/12, (width*37/60)*experience/experienceNeeded, width/30);
    fill(BLACK);
    textAlign(LEFT, CENTER);
    text(" Level: " + shipLevel, width*4/15, width*358/600);
    textAlign(RIGHT, CENTER);
    text(experience + "/" + experienceNeeded, width*530/600, width*358/600);
  }
}