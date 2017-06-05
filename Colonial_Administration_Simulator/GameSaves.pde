class gameSaves {
  int sTurn, sPops, sFood, sMinerals, sEnergy, sResearch;
  JSONObject thisSaveGame;
  String gameToLoad;
  gameSaves(int gameFile) {
    if (gameFile == 0) {
      gameToLoad = "saveGame1.json";
    } else if (gameFile == 1) {
      gameToLoad = "saveGame2.json";
    } else if (gameFile == 2) {
      gameToLoad = "saveGame3.json";
    }
    updateSave();
  }

  void updateSave() {
    thisSaveGame = loadJSONObject(gameToLoad);
    sTurn = thisSaveGame.getInt("turn");
    sPops = thisSaveGame.getInt("pops");
    sFood = thisSaveGame.getInt("food");
    sMinerals = thisSaveGame.getInt("minerals");
    sEnergy = thisSaveGame.getInt("energy");
    sResearch = thisSaveGame.getInt("research");
  }
}