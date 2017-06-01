class resourceManager {
  resourceManager() {
  }


  void updateResources() {
    // Applies increases and checks for a game over.
    // Also ensures resources do not go over their maxes.

    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;
    research = researchIncrease;

    if (food > 100 && foodIncrease > 10) {
      pops++;
      food = food - 100;
    } else if (food < 100 && foodIncrease < 10 && pops > 10) {
      pops--;
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


    updateFoodIncreases();
    updateMineralIncreases();
    updatePowerIncreases();
    updateResearchIncreases();

    //popResearchBonus = ;
    //foodResearchBonus = researchTracks[0].bonus;
    //buildTimeResearchBonus = ;
    //buildCostResearchBonus = ;
    //mineralResearchBonus = ;
    //energyResearchBonus = ;

    //mineralIncrease = mineralIncrease - mineralTax;
    //energyIncrease = energyIncrease - energyTax;
    //foodIncrease = foodIncrease + int(foodIncrease * foodResearchBonus);
  }

  void updateFoodIncreases() {
    foodIncrease = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        foodIncrease += buildingGrid[i][j].foodValue;
      }
    }

    foodTax = pops;
    foodIncrease = foodIncrease - foodTax;

    foodMax = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType == 1) {
          foodMax++;
        }
      }
    }
    foodMax = foodMax * 10;

    if (foodMax < 0) {
      foodMax = 10;
    }
  }

  void updateMineralIncreases() {
    mineralIncrease = getBuildingMineralIncrease() + getPopMineralIncrease();

    mineralTax = getMineralTax();

    mineralIncrease = mineralIncrease - mineralTax;

    mineralMax = mineralIncrease * 10 + getNoOfBuildings() * 5;

    if (mineralMax < 100) {
      mineralMax = 100;
    }
  }

  void updatePowerIncreases() {

    energyIncrease = getBuildingEnergyIncrease() + getPopEnergyIncrease();

    energyTax = getEnergyTax();

    energyIncrease = energyIncrease - energyTax;

    energyMax = energyIncrease * 10;

    if (energyMax < 100) {
      energyMax = 100;
    }
  }

  void updateResearchIncreases() {
    researchIncrease = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        researchIncrease += buildingGrid[i][j].researchValue;
      }
    }
  }

  // Energy Functions

  int getBuildingEnergyIncrease() {
    int bei = 0;

    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        bei += buildingGrid[i][j].powerValue;
      }
    }
    return bei;
  }

  int getPopEnergyIncrease() {
    return getBuildingEnergyIncrease() * pops/3;
  }

  int getEnergyTax() {
    int bet = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          bet++;
        }
        if (buildingGrid[i][j].tileLevel == 3) {
          bet++;
        }
      }
    }
    return bet;
  }

  // Mineral Functions

  int getBuildingMineralIncrease() {
    int bmi = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        bmi += buildingGrid[i][j].mineralValue;
      }
    }
    return bmi;
  }

  int getPopMineralIncrease() {
    return getBuildingEnergyIncrease() * pops/3;
  }

  int getMineralTax() {
    int bmt = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          bmt++;
        }
      }
    }
    return bmt;
  }

  int getNoOfBuildings() {
    int noOfBuildings = 0;
    for (int i=0; i<tilesWide; i++) {
      for (int j=0; j<tilesHigh; j++) {
        if (buildingGrid[i][j].tileType != 0) {
          noOfBuildings++;
        }
      }
    }
    return noOfBuildings;
  }
}