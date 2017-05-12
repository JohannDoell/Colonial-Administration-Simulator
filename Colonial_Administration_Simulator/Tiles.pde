class tiles {
  int researchValue, mineralValue, powerValue, foodValue;
  int tileType, tileLevel;
  int x, y;
  int tileWidth, tileHeight;
  int tileLocationX, tileLocationY;
  char tileChar;
  int buildTime = 0;
  boolean isBuilding = false;
  tiles (int _x, int _y) {
    x = _x;
    y = _y;
    tileWidth = 100;
    tileHeight = tileWidth;
    tileLevel = 1;
    tileLocationX = 100+(x*tileWidth);
    tileLocationY = 100+(y*tileHeight);
  }

  void tileUpdate() {
    // Blank/Deconstructed Tile
    if (tileType == 0) {
      tileLevel = 1;
      tileChar = ' ';
      researchValue = 0;
      mineralValue = 0;
      powerValue = 0;
      foodValue = 0;
    }
    // Farms
    if (tileType == 1) {
      tileChar = 'F';
      if (tileLevel == 1) {
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
      if (tileLevel == 1) {
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
      if (tileLevel == 1) {
        powerValue = 3;
      } else if (tileLevel == 2) {
        powerValue = 5;
      } else if (tileLevel == 3) {
        powerValue = 15;
      }
    }
    // Research Stations
    if (tileType == 4) {
      tileChar = 'R';
      if (tileLevel == 1) {
        researchValue = 5;
      } else if (tileLevel == 2) {
        researchValue = 10;
      } else if (tileLevel == 3) {
        researchValue = 20;
      }
    }
    if (this.buildTime == 0 && this.isBuilding == true) {
     tileLevel++;
     isBuilding = false;
    }
  }

  void displayTile() {
    if (mouseX > tileLocationX-(tileWidth/2) && mouseX < tileLocationX+(tileWidth/2) && mouseY > tileLocationY-(tileHeight/2) && mouseY < tileLocationY+(tileHeight/2)) {
      fill(GREY);
    } else {
      fill(WHITE);
    }
    rect(tileLocationX, tileLocationY, tileWidth, tileHeight);
    fill(BLACK);
    textSize(64);
    textAlign(CENTER, CENTER);
    text(tileChar, tileLocationX, tileLocationY-5);
  }

  void selectTile() {
    if (mouseX > tileLocationX-(tileWidth/2) && mouseX < tileLocationX+(tileWidth/2) && mouseY > tileLocationY-(tileHeight/2) && mouseY < tileLocationY+(tileHeight/2)) {
      selectedGridX = x;
      selectedGridY = y;
      constructionMenu.resetGates();
    }
  }

  void upgradeTile() {
    minerals = minerals - this.getUpgradeCost();
    this.buildTime = (this.getUpgradeCost())/10;
    this.isBuilding = true;
  }

  int getUpgradeCost() {
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
}