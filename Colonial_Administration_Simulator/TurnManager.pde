class turnManager { //<>//
  turnManager() {
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

  void processResearch() {
    for (int i=0; i<7; i++) {
      researchTracks[i].research();
      researchTracks[i].setResearchMenuVariables();
    }
  }

  void processShips() {
    for (int i=0; i<3; i++) {
      ships[i].shipUpdate();
    }
  }

  void advanceTurn() {
    // Self explanatory.
    turn++;
    resoMan.updateResources();
    processConstruction();
    processResearch();
    processShips();
  }

  void setupBaseGame() {
    gameFileMan.loadBaseFile();
  }
}