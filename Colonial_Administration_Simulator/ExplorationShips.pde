class explorationShips {
  boolean isBought, isHome;
  int experience, experienceNeeded, shipLevel;
  int health, maxHealth;
  int missionProgress, totalMissionProgress;
  int failureReduction;
  int reqPrice;
  int[] requiredXPArray = {100, 300, 500, 750, 1000, 99999999};
  String[] shipNames = {"JDS Yamato", "HIRMS Sputnik III", "USS Enterprise"};
  int[] percentChanceArray = {0, 10, 25, 50, 70, 80};
  int[] maxHealthArray = {5, 10, 25, 60, 80, 100};

  int roll;

  int resourceChance, buildingChance, relicChance, successChance, difficulty;

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
    failureReduction = percentChanceArray[shipLevel];
    maxHealth = maxHealthArray[shipLevel];
    if (health < 0) {
      health = 0;
    }
  }

  void levelUpShip() {
    if (experience >= experienceNeeded) {
      shipLevel++; 
      experience = 0;
      maxHealth = maxHealthArray[shipLevel];
      health = maxHealth;
    }
    if (shipLevel >= 5) {
      shipLevel = 5;
      experience = 0;
    }
  }

  void checkMissionStatus() {
    if (isHome == false) {
      missionProgress++;
      if (missionProgress >= totalMissionProgress) {
        makeSuccessRoll();
        isHome = true;
      }
    }
  }

  void makeSuccessRoll() {
    roll = int(random(1, 100.1));
    //experience += ((100 - roll)/2)*(difficulty+1);
    //println(roll, successChance);
    if (roll <= successChance) {
      roll = int(random(1, 100.1));
      println("Relic Roll: " + roll, "Target: " + relicChance);
      if (roll <= relicChance) {
        relics++;
        experience += 1000;
      } else {
        experience += ((100 - roll)/2)*(difficulty+1);
      }
    } else {
      health = health - (roll - successChance);
      experience += (((100 - roll)/2)*(difficulty+1))/10;
    }
  }

  void buyShip() {
    energy = energy - reqPrice;
    isBought = true;
    health = maxHealth;
  }

  void beginShipMission() {
    successChance = missions[selectedMission].successChance;
    relicChance = missions[selectedMission].relicChance;
    difficulty = missions[selectedMission].difficulty;
    totalMissionProgress = missions[selectedMission].missionLength;
    missionProgress = 0;
    isHome = false;
  }

  void displayShipInfo() {
    // Display Info
    // Name
    textAlign(LEFT, CENTER);
    textSize(width*2/75);
    text(shipNames[selectedShip], width*4/15, width*8/15);
    textAlign(LEFT, CENTER);
    // Health
    text(health + "/" + maxHealth, width*480/600, width*8/15);
    imageMode(CENTER);
    image(pHealth, width*465/600, width*8/15, width/25, width/25);
    imageMode(CORNER);

    // Level + Experience
    fill(WHITE);
    rect(width*4/15, width*7/12, width*37/60, width/30);
    fill(GREEN);
    rect(width*4/15, width*7/12, (width*37/60)*experience/experienceNeeded, width/30);
    fill(BLACK);
    textAlign(LEFT, CENTER);
    if (shipLevel != 5) {
      text(" Level: " + shipLevel, width*4/15, width*358/600);
      textAlign(RIGHT, CENTER);
      text(experience + "/" + experienceNeeded, width*530/600, width*358/600);
    } else {
      text(" Level: Max", width*4/15, width*358/600);
      textAlign(RIGHT, CENTER);
      text("Max ", width*530/600, width*358/600);
    }
    // Mission Progress
    fill(WHITE);
    rect(width*4/15, width*370/600, width*37/60, width*20/600);
    if (isHome == false) {
      fill(GREEN);
      rect(width*4/15, width*370/600, (width*37/60)*missionProgress/totalMissionProgress, width*20/600);
    }
    fill(BLACK);
    if (isHome == false) {
      textAlign(LEFT, CENTER);
      text(" Mission Progress:", width*160/600, width*378/600);
      textAlign(RIGHT, CENTER);
      text(missionProgress+"/"+totalMissionProgress, width*530/600, width*378/600);
    } else {
      textAlign(LEFT, CENTER);
      text(" Awaiting Assignment", width*160/600, width*378/600);
      textAlign(RIGHT, CENTER);
    }

    // Actions
    String[] actions = {"Deploy", "Repair", "Upgrade"};
    for (int i=0; i<3; i++) {
      fill(getColor(i));
      rect((width*4/15)+(i*width*9/40), width*2/3, width/6, width/15);
      fill(BLACK);
      textAlign(CENTER, CENTER);
      text(actions[i], (width*210/600)+(i*width*9/40), width*418/600);
    }
    // Hover Text
    for (int i=1; i<3; i++) {
      if (mouseX > (width*4/15)+(i*width*9/40) && mouseY > width*2/3 && mouseX < (width*4/15)+(i*width*9/40)+width/6 && mouseY < (width*2/3)+(width/15)) {
        if (getColor(i) != RED) {
          fill(WHITE);
          rect(mouseX, mouseY, width/4, width*25/600);
          textAlign(LEFT, CENTER);
          fill(BLACK);
          image(pEnergy, mouseX+width*55/600, mouseY+width*5/600, width/40, width/40);
          text("Cost:    " + getCost(i), mouseX+width*10/600, mouseY+width*10/600);
        }
      }
    }
  }

  void displayReqInfo() {
    // Display Requisition Info
    if (mouseX > width/3 && mouseX < width/3+width*7/15 && mouseY > width*7/12 && mouseY < width*7/12+width/12) {
      if (buildGate == true) {
        if (this.canBuyShip() == true) {
          fill(DARKGREEN);
        } else {
          fill(RED);
        }
      } else {
        fill(GREY);
      }
    } else {
      if (buildGate == true) {
        fill(GREEN);
      } else {
        fill(WHITE);
      }
    }
    textAlign(LEFT, CENTER);
    rect(width/3, width*7/12, width*7/15, width/12);
    fill(BLACK);
    text("REQUISITION:   " + this.reqPrice, width*7/20, width*5/8);
    imageMode(CENTER);
    image(pEnergy, width*27/40, width*19/30, width/30, width/30);
    imageMode(CORNER);
  }

  boolean getGate(int i) {
    if (i == 0) {
      return deployGate;
    } else if (i == 1) {
      return repairGate;
    } else if (i == 2) {
      return shipUpgradeGate;
    } else {
      return false;
    }
  }

  color getColor(int i) {
    if (mouseX > (width*4/15)+(i*width*9/40) && mouseY > width*2/3 && mouseX < (width*4/15)+(i*width*9/40)+width/6 && mouseY < (width*2/3)+(width/15)) {
      if (getGate(i) == true) {
        return DARKGREEN;
      } else {
        if (i == 1) {
          if (canRepairShip() == false) {
            return RED;
          }
        } else if (i == 2) {
          if (canUpgradeShip() == false) {
            return RED;
          }
        }
        return GREY;
      }
    } else {
      if (getGate(i) == true) {
        return GREEN;
      } else {
        return WHITE;
      }
    }
  }

  void interpretAction(int i) {
    if (i == 0) {
      if (canDeploy() == true) {
        deployShip();
      }
    } else if (i == 1) {
      if (canRepairShip() == true) {
        repairShip();
      }
    } else if (i == 2) {
      if (canUpgradeShip() == true) {
        upgradeShip();
      }
    }
  }

  void deployShip() {
    if (health >= 1 && isHome == true) {
      if (deployGate == false) {
        gmf.resetGates();
        deployGate = true;
      } else {
        gmf.resetGates();
        beginShipMission();
      }
    }
  }

  void repairShip() {
    if (repairGate == false) {
      if (energy >= getRepairCost()) {
        gmf.resetGates();
        repairGate = true;
      }
    } else {
      gmf.resetGates();
      energy = energy - getRepairCost();
      health = maxHealth;
    }
  }

  void upgradeShip() {
    if (shipUpgradeGate == false) {
      if (energy >= getUpgradeCost()) {
        gmf.resetGates();
        shipUpgradeGate = true;
      }
    } else {
      gmf.resetGates();
      energy = energy - getUpgradeCost();
      experience = experienceNeeded;
    }
  }

  boolean canDeploy() {
    if (health > 0 || isHome == true) {
      return true;
    } else {
      return false;
    }
  }

  boolean canBuyShip() {
    if (energy >= reqPrice) {
      return true;
    } else {
      return false;
    }
  }

  boolean canRepairShip() {
    if (isHome == false) {
      return false;
    }
    if (health < maxHealth) {
      return true;
    } else {
      return false;
    }
  }

  boolean canUpgradeShip() {
    if (isHome == false) {
      return false;
    }
    if (shipLevel >= 5) {
      return false;
    } else {
      return true;
    }
  }

  int getCost(int i) {
    if (i == 1) {
      return getRepairCost();
    } else if (i == 2) {
      return getUpgradeCost();
    } else {
      return -1;
    }
  }

  int getRepairCost() {
    return (maxHealth - health) * 2;
  }

  int getUpgradeCost() {
    return (experienceNeeded - experience) * 10;
  }
}