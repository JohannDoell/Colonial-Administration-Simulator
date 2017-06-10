class explorationShips {
  boolean isBought, isHome;
  int experience, shipLevel;
  int health, maxHealth;
  int percentChance;
  int reqPrice;
  int[] requiredXPArray = {100, 300, 500, 750, 1000};
  String[] shipNames = {"JDS Yamato", "HIRMS Sputnik III", "USS Enterprise"};
  explorationShips (int i) {
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
    resetValues();
    skillLevelUpdate();
    shipLevelUpdate();
  }

  void shipLevelUpdate() {
    if (shipLevel == 0) {
      maxHealth = 0;
      percentChance = 0;
    } else if (shipLevel == 1) {      
      maxHealth = 10;
      percentChance = 10;
    } else if (shipLevel == 2) {      
      maxHealth = 25;
      percentChance = 25;
    } else if (shipLevel == 3) {      
      maxHealth = 60;
      percentChance = 50;
    } else if (shipLevel == 4) {      
      maxHealth = 80;
      percentChance = 70;
    } else if (shipLevel == 5) {      
      maxHealth = 100;
      percentChance = 90;
    }
  }

  void skillLevelUpdate() {
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

  void resetValues() {
    maxHealth = 10;
  }
}