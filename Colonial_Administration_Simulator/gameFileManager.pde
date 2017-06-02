class gameFileManager {
  gameFileManager() {
  }

  void loadSaveGame(String fileToLoad) {
    saveGame = loadJSONObject(fileToLoad);
    turn = saveGame.getInt("turn");
    pops = saveGame.getInt("pops");
    food = saveGame.getInt("food");
    minerals = saveGame.getInt("minerals");
    energy = saveGame.getInt("energy");
    research = saveGame.getInt("research");
    foodIncrease = saveGame.getInt("foodIncrease");
    mineralIncrease = saveGame.getInt("mineralIncrease");
    energyIncrease = saveGame.getInt("energyIncrease");
    for (int i = 0; i<7; i++ ) {
      researchTracks[i].progress = saveGame.getInt("researchTracks[" + i + "].progress");
      researchTracks[i].researchTime = saveGame.getInt("researchTracks[" + i + "].researchTime");
    }
    for (int i = 0; i<tilesWide; i++) {
      for (int j = 0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileType = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileType");
        buildingGrid[i][j].tileLevel = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileLevel");
      }
    }
    println("File:'" + fileToLoad + "'Loaded");
  }

  void saveSave() {
    saveGame = new JSONObject();
    saveGame.setInt("turn", turn);
    saveGame.setInt("pops", pops);
    saveGame.setInt("food", food);
    saveGame.setInt("minerals", minerals);
    saveGame.setInt("energy", energy);
    saveGame.setInt("research", research);
    saveGame.setInt("foodIncrease", foodIncrease);
    saveGame.setInt("mineralIncrease", mineralIncrease);
    saveGame.setInt("energyIncrease", energyIncrease);
    for (int i = 0; i<7; i++ ) {
      saveGame.setInt("researchTracks[" + i + "].progress", researchTracks[i].progress);
      saveGame.setInt("researchTracks[" + i + "].researchTime", researchTracks[i].researchTime);
    }
    for (int i = 0; i<tilesWide; i++) {
      for (int j = 0; j<tilesHigh; j++) {
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileType", buildingGrid[i][j].tileType);
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileLevel", buildingGrid[i][j].tileLevel);
      }
    }
    saveJSONObject(saveGame, "data/saveGame.json");
    println("Game Saved");
  }

  void loadSave() {
    loadSaveGame("saveGame.json");
  }

  void loadBaseFile() {    
    loadSaveGame("baseGame.json");
    reseMan.setupBaseResearch();
  }
}