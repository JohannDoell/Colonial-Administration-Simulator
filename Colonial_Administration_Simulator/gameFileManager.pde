class gameFileManager {
  gameFileManager() {
  }

  void loadSave() {
    saveGame = loadJSONObject("saveGame.json");
    turn = saveGame.getInt("turn");
    pops = saveGame.getInt("pops");
    food = saveGame.getInt("food");
    minerals = saveGame.getInt("minerals");
    energy = saveGame.getInt("energy");
    research = saveGame.getInt("research");
    foodIncrease = saveGame.getInt("foodIncrease", foodIncrease);
    mineralIncrease = saveGame.getInt("mineralIncrease", mineralIncrease);
    energyIncrease = saveGame.getInt("energyIncrease", energyIncrease);
    for (int i = 0; i<tilesWide; i++) {
      for (int j = 0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileType = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileType");
        buildingGrid[i][j].tileLevel = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileLevel");
      }
    }
    println("File:'SaveGame'Loaded");
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
    for (int i = 0; i<tilesWide; i++) {
      for (int j = 0; j<tilesHigh; j++) {
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileType", buildingGrid[i][j].tileType);
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileLevel", buildingGrid[i][j].tileLevel);
      }
    }
    saveJSONObject(saveGame, "data/saveGame.json");
    println("Game Saved");
  }

  void loadBaseFile() {    
    baseGame = loadJSONObject("baseGame.json");
    turn = baseGame.getInt("turn");
    pops = baseGame.getInt("pops");
    food = baseGame.getInt("food");
    minerals = baseGame.getInt("minerals");
    energy = baseGame.getInt("energy");
    research = baseGame.getInt("research");
    foodIncrease = baseGame.getInt("foodIncrease", foodIncrease);
    mineralIncrease = baseGame.getInt("mineralIncrease", mineralIncrease);
    energyIncrease = baseGame.getInt("energyIncrease", energyIncrease);
    for (int i = 0; i<tilesWide; i++) {
      for (int j = 0; j<tilesHigh; j++) {
        buildingGrid[i][j].tileType = baseGame.getInt("buildingGrid[" + i + "][" + j + "].tileType");
        buildingGrid[i][j].tileLevel = baseGame.getInt("buildingGrid[" + i + "][" + j + "].tileLevel");
      }
    }
    println("File:'baseGame'Loaded");

    resMan.setupBaseResearch();
  }
}