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
    for (int i = 0; i<5; i++) {
      for (int j = 0; j<3; j++) {
        buildingGrid[i][j].tileType = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileType");
        buildingGrid[i][j].tileLevel = saveGame.getInt("buildingGrid[" + i + "][" + j + "].tileLevel");
      }
    }
  }

  void saveSave() {
    saveGame = new JSONObject();
    saveGame.setInt("turn",turn);
    saveGame.setInt("pops", pops);
    saveGame.setInt("food", food);
    saveGame.setInt("minerals", minerals);
    saveGame.setInt("energy", energy);
    saveGame.setInt("research", research);
    for (int i = 0; i<5; i++) {
      for (int j = 0; j<3; j++) {
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileType", buildingGrid[i][j].tileType);
        saveGame.setInt("buildingGrid[" + i + "][" + j + "].tileLevel", buildingGrid[i][j].tileLevel);
      }
    }
    saveJSONObject(saveGame, "data/saveGame.json");
  }
}