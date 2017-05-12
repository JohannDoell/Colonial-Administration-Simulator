class tiles {
  int researchValue, mineralValue, powerValue, foodValue;
  int tileType, tileLevel;
  int x, y;
  int tileWidth, tileHeight;
  char tileChar;
  tiles (int _x, int _y) {
    x = _x;
    y = _y;
    tileWidth = 100;
    tileHeight = tileWidth;
    tileLevel = 1;
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
        foodValue = 3;
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
  }

  void displayTile() {
    fill(WHITE);
    rect(100+(x*tileWidth), 100+(y*tileHeight), tileWidth, tileHeight);
    fill(BLACK);
    textSize(64);
    textAlign(CENTER, CENTER);
    text(tileChar, 100+(x*tileWidth), 95+(y*tileHeight));
  }
}