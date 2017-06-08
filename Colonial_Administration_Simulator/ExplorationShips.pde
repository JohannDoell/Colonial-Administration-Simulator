class explorationShips {
  boolean isConstructed, isHome;
  int scienceLevel, militaryLevel, diplomacyLevel, relicLevel;
  int scienceValue, militaryValue, diplomacyValue, relicValue;
  int experience, shipLevel;
  int health, maxHealth;
  int[] requiredXPArray = {100, 300, 500, 750, 1000};
  explorationShips () {
    isConstructed = false;
    scienceLevel = 0;
    militaryLevel = 0;
    diplomacyLevel = 0;
    relicLevel = 0;
  }

  void shipUpdate() {
    resetValues();
    skillLevelUpdate();
    shipLevelUpdate();
  }

  void shipLevelUpdate() {
    if (shipLevel == 0) {
      maxHealth = 0;
    } else if (shipLevel == 1) {      
      maxHealth = 10;
    } else if (shipLevel == 2) {      
      maxHealth = 25;
    } else if (shipLevel == 3) {      
      maxHealth = 60;
    } else if (shipLevel == 4) {      
      maxHealth = 80;
    } else if (shipLevel == 5) {      
      maxHealth = 100;
    }
  }

  void skillLevelUpdate() {
    // Science Level Management
    if (scienceLevel == 0) {
      scienceValue = 0;
    } else if (scienceLevel == 1) {
      scienceValue = 10;
    } else if (scienceLevel == 2) {
      scienceValue = 25;
    } else if (scienceLevel == 3) {
      scienceValue = 50;
    }
    // Military Level Management
    if (militaryLevel == 0) {
      militaryValue = 0;
    } else if (militaryLevel == 1) {
      militaryValue = 10;
    } else if (militaryLevel == 2) {
      militaryValue = 25;
    } else if (militaryLevel == 3) {
      militaryValue = 50;
    }
    // Diplomatic Level Management
    if (diplomacyLevel == 0) {
      diplomacyValue = 0;
    } else if (scienceLevel == 1) {
      diplomacyValue = 10;
    } else if (scienceLevel == 2) {
      diplomacyValue = 25;
    } else if (scienceLevel == 3) {
      diplomacyValue = 50;
    }
  }

  void resetValues() {
    scienceValue = 0;
    militaryValue = 0;
    diplomacyValue = 0;
    relicValue = 0;
    maxHealth = 10;
  }
}