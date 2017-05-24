class tiles {
  int researchValue, mineralValue, powerValue, foodValue;
  int tileType, tileLevel;
  int x, y;
  int tileWidth, tileHeight;
  int tileLocationX, tileLocationY;
  char tileChar;
  int upgradeTime, buildTime, totalUpgradeTime, totalBuildTime;
  boolean isUpgrading, isBuilding;
  tiles (int _x, int _y) {
    x = _x;
    y = _y;
    tileWidth = width/6*5/tilesWide;
    tileHeight = tileWidth;
    tileLevel = 1;
    tileLocationX = width/6+(x*tileWidth);
    tileLocationY = width/6+(y*tileHeight);
    upgradeTime = 0;
    buildTime = 0;
    totalUpgradeTime = 0;
    totalBuildTime = 0;
    isUpgrading = false;
    isBuilding = false;
  }

  void tileUpdate() {
    resetValues();
    // Check each tile for its current resource output and update to that.
    // Blank/Deconstructed Tile
    if (tileType == 0) {
      tileLevel = 0;
    }
    // Farms
    if (tileType == 1) {
      tileChar = 'F';
      if (tileLevel == 0) {
        foodValue = 0;
      } else if (tileLevel == 1) {
        foodValue = 2;
      } else if (tileLevel == 2) {
        foodValue = 5;
      } else if (tileLevel == 3) {
        foodValue = 10;
      }
    }
    // Mines
    if (tileType == 2) {
      tileChar = 'M'; 
      if (tileLevel == 0) {
        mineralValue = 0;
      } else if (tileLevel == 1) {
        mineralValue = 5;
      } else if (tileLevel == 2) {
        mineralValue = 10;
      } else if (tileLevel == 3) {
        mineralValue = 15;
      }
    }
    // Power Stations
    if (tileType == 3) {
      tileChar = 'P'; 
      if (tileLevel == 0) {
        powerValue = 0;
      } else if (tileLevel == 1) {
        powerValue = 3;
      } else if (tileLevel == 2) {
        powerValue = 5;
      } else if (tileLevel == 3) {
        powerValue = 10;
      }
    }
    // Research Stations
    if (tileType == 4) {
      tileChar = 'R'; 
      if (tileLevel == 0) {
        researchValue = 0;
      } else if (tileLevel == 1) {
        researchValue = 5;
      } else if (tileLevel == 2) {
        researchValue = 10;
      } else if (tileLevel == 3) {
        researchValue = 20;
      }
    }
    // Also check for the current status of construction jobs.
    // If completed, finish the process and upgrade/update.
    if (this.upgradeTime == 0 && this.isUpgrading == true) {
      tileLevel++;
      isUpgrading = false;
      this.totalUpgradeTime = 0;
    }
    if (this.buildTime == 0 && this.isBuilding == true) {
      tileLevel++;
      isBuilding = false;
      this.totalBuildTime = 0;
    }
  }

  void resetValues() {
    tileChar = ' ';
    researchValue = 0;
    mineralValue = 0;
    powerValue = 0;
    foodValue = 0;
  }

  void displayTile() {
    // Displays tiles and progress bars.
    if (mouseX > tileLocationX-(tileWidth/2) && mouseX < tileLocationX+(tileWidth/2) && mouseY > tileLocationY-(tileHeight/2) && mouseY < tileLocationY+(tileHeight/2)) {
      fill(GREY);
    } else if (selectedGridX == this.x && selectedGridY == this.y) {
      fill(LIGHTGREY);
    } else {
      fill(WHITE);
    }
    rect(tileLocationX, tileLocationY, tileWidth, tileHeight);
    fill(BLACK);
    textSize(width*8/75);
    textAlign(CENTER, CENTER);
    imageMode(CENTER);
    image(this.getImage(), tileLocationX, tileLocationY, tileWidth/2, tileWidth/2);
    imageMode(CORNER);
    fill(WHITE);
    // Progress Bar
    if (this.buildTime != 0 || this.upgradeTime != 0) {
      rect(tileLocationX, tileLocationY+width/24, width*7/60, width/120);
    }
    rectMode(CORNER);
    if (this.buildTime != 0) {
      fill(GREEN);
      rect(tileLocationX-width*7/120, tileLocationY+width*11/300, width*7/60-width*7/60*(buildTime-1)/totalBuildTime, width/120);
    }
    if (this.upgradeTime != 0) {
      fill(GREEN);
      rect(tileLocationX-width*7/120, tileLocationY+width*11/300, width*7/60-width*7/60*(upgradeTime-1)/totalUpgradeTime, width/120);
    }
    rectMode(CENTER);
    fill(WHITE);
  }

  void selectTile() {
    // Checks for click and then selects if possible.
    // Resets some gates to avoid glitches.
    if (mouseX > tileLocationX-(tileWidth/2) && mouseX < tileLocationX+(tileWidth/2) && mouseY > tileLocationY-(tileHeight/2) && mouseY < tileLocationY+(tileHeight/2)) {
      selectedGridX = x;
      selectedGridY = y;
      constructionMenu.resetGates();
      constructionMenu.desiredBuilding = 'N';
    }
  }

  void upgradeTile() {
    // Upgrade Process called through the menu.
    minerals = minerals - this.getUpgradeCost();
    this.upgradeTime = (this.getUpgradeCost())/10;
    this.totalUpgradeTime = this.upgradeTime;
    this.isUpgrading = true;
  }

  void buildTile(char buildType) {
    // Build Process called through the menu.
    minerals = minerals - this.getBuildCost(buildType);
    this.buildTime = (this.getBuildCost(buildType))/10;
    this.isBuilding = true;
    this.totalBuildTime = this.buildTime;
    if (buildType == 'F') {
      tileType = 1;
    }
    if (buildType == 'M') {
      tileType = 2;
    }
    if (buildType == 'P') {
      tileType = 3;
    }
    if (buildType == 'R') {
      tileType = 4;
    }
    tileLevel = 0;
  }

  int getBuildCost(char buildType) {
    // Finds the build cost by being called by the menu.
    int noOf = 0;
    // Farms
    if (buildType == 'F') {
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          if (buildingGrid[i][j].tileType == 1) {
            noOf++;
          }
        }
      }
      return noOf * 300;
    }
    // Mines
    if (buildType == 'M') {
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          if (buildingGrid[i][j].tileType == 2) {
            noOf++;
          }
        }
      }
      return noOf * 100;
    }
    // Power Stations
    if (buildType == 'P') {
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          if (buildingGrid[i][j].tileType == 3) {
            noOf++;
          }
        }
      }
      return noOf * 500;
    }
    // Research Stations
    if (buildType == 'R') {
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          if (buildingGrid[i][j].tileType == 4) {
            noOf++;
          }
        }
      }
      return noOf * 500;
    }
    return 0;
  }

  int getUpgradeCost() {
    // Finds the upgrade cost after being called by the menu.
    // Farms
    if (tileType == 1) {
      if (tileLevel == 1) {
        return 20;
      } else if (tileLevel == 2) {
        return 100;
      } else if (tileLevel == 3) {
        return 0;
      }
    }
    // Mines
    if (tileType == 2) {
      if (tileLevel == 1) {
        return 20;
      } else if (tileLevel == 2) {
        return 100;
      } else if (tileLevel == 3) {
        return 0;
      }
    }
    // Power Stations
    if (tileType == 3) {
      if (tileLevel == 1) {
        return 50;
      } else if (tileLevel == 2) {
        return 150;
      } else if (tileLevel == 3) {
        return 0;
      }
    }
    // Research Stations
    if (tileType == 4) {
      if (tileLevel == 1) {
        return 50;
      } else if (tileLevel == 2) {
        return 200;
      } else if (tileLevel == 3) {
        return 0;
      }
    }
    // Blank/Deconstructed Tile
    return 0;
  }

  PImage getImage() {    
    if (tileChar == 'M') {
      return pMineral;
    } else if (tileChar == 'F') {
      return pFood;
    } else if (tileChar == 'P') {
      return pEnergy;
    } else if (tileChar == 'R') {
      return pResearch;
    } else {
      return pNil;
    }
  }

  boolean isConstructing() {
    /** 
     Checks if the building is upgrading or building.
     If it is not building, returns false.
     Else, returns true.
     */
    if (buildTime == 0 && upgradeTime == 0) {
      return false;
    } else {
      return true;
    }
  }
}