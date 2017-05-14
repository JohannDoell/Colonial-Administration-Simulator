class turnManager {
  turnManager() {
  }

  void updateResources() {
    // Applies increases and checks for a game over.
    // Also ensures resources do not go over their maxes.
    pops = pops + popIncrease;

    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;

    if (food > 150) {
      pops++;
      food = food - 100;
    }

    if (food < 0 || energy < 0 || minerals < 0) {
      state = 2;
    }

    if (food > foodMax) {
      food = foodMax;
    }
    if (energy > energyMax) {
      energy = energyMax;
    }
    if (minerals > mineralMax) {
      minerals = mineralMax;
    }
  }

  void updateResourceIncreases() {
    // Checks for the increase and the tax of each resource.
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileUpdate();
      }
    }

    mineralIncrease = 0;
    energyIncrease = 0;
    foodIncrease = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        mineralIncrease += buildingGrid[i][j].mineralValue;
        energyIncrease += buildingGrid[i][j].powerValue;
        foodIncrease += buildingGrid[i][j].foodValue;
      }
    }

    mineralIncrease = mineralIncrease * pops/3;
    energyIncrease = energyIncrease * pops/3;

    mineralTax = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          mineralTax++;
        }
      }
    }

    energyTax = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0 && buildingGrid[i][j].tileType != 3) {
          energyTax++;
        }
        if (buildingGrid[i][j].tileLevel == 3) {
          energyTax++;
        }
      }
    }

    foodTax = pops;

    mineralIncrease = mineralIncrease - mineralTax;
    energyIncrease = energyIncrease - energyTax;
    foodIncrease = foodIncrease - foodTax;

    foodMax = foodIncrease * 10;
    energyMax = energyIncrease * 10;

    int noOfBuildings = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          noOfBuildings++;
        }
      }
    }

    mineralMax = mineralIncrease * 10 + noOfBuildings * 5;

    if (foodMax < 0) {
      foodMax = 10;
    }
    if (energyMax < 100) {
      energyMax = 100;
    }
    if (mineralMax < 100) {
      mineralMax = 100;
    }

    popIncrease = (food/50)-pops/3;
    if (popIncrease > 1) {
      popIncrease = 1;
    } else if (popIncrease < 0) {
      popIncrease = 0;
    }
  }

  void processConstruction() {
    // Advances each construction time by one.
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].upgradeTime > 0) {
          buildingGrid[i][j].upgradeTime--;
        }
      }
    }
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].buildTime > 0) {
          buildingGrid[i][j].buildTime--;
        }
      }
    }
  }

  void advanceTurn() {
    // Self explanatory.
    turn++;
    updateResources();
    processConstruction();
  }

  void setupBaseGame() {
    // Self explanatory.
    // Default if not loading a game.
    pops = 3;
    food = 10;
    minerals = 100;
    energy = 100;

    buildingGrid[0][0].tileType = 1;
    buildingGrid[4][2].tileType = 2;
    buildingGrid[0][2].tileType = 3;
    buildingGrid[4][0].tileType = 4;
  }
}