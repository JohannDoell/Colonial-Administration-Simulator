class tiles {
  int researchValue, mineralValue, powerValue, foodValue;
  int tileType, tileLevel;
  int x, y;
  int tileWidth, tileHeight;
  tiles (int _x, int _y) {
    x = _x;
    y = _y;
    tileWidth = 100;
    tileHeight = tileWidth;
  }

  void tileUpdate() {
    // Blank/Deconstructed Tile
    if (tileType == 0) {
     researchValue = 0;
     mineralValue = 0;
     powerValue = 0;
     foodValue = 0;
    }
    // Farms
    if (tileType == 1) {
      if (tileLevel == 1) {
        foodValue = 3;
      } else if (tileLevel == 2) {
        foodValue = 5;
      } else if (tileLevel == 3) {
        foodValue = 10;
      }
    }
    // Mines
    if (tileType == 2) {
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
      if (tileLevel == 1) {
        researchValue = 5;
      } else if (tileLevel == 2) {
        researchValue = 10;
      } else if (tileLevel == 3) {
        researchValue = 20;
      }
    }
  }

  void displayTile() {
    fill(WHITE);
    rect(100+(x*tileWidth), 100+(y*tileHeight), tileWidth,tileHeight);
  }
}