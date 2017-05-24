class gameFileManager {
  gameFileManager() {
  }

  void loadSaveFile(String file) {
    saveGame = loadJSONObject(file + ".json");
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
  }

  void loadBaseFile() {    
    turn = 0;
    pops = 3;
    food = 10;
    minerals = 100;
    energy = 100;
    research = 0;
    foodIncrease = -1;
    mineralIncrease = 1;
    energyIncrease = 0;

    buildingGrid[0][0].tileType = 1;
    buildingGrid[tilesWide-1][tilesHigh-1].tileType = 2;
    buildingGrid[0][tilesHigh-1].tileType = 3;
    buildingGrid[tilesWide-1][0].tileType = 4;

    resMan.randomizeResearchChoices();
  }
  
  void loadSave() {
   loadSaveFile("saveGame"); 
  }
}