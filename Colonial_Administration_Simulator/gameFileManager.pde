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

  void saveSaveGame(String fileToSave) {
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
    saveJSONObject(saveGame, "data/" + fileToSave);
    println("Game:'"+ fileToSave +"'Saved");
  }

  void saveSave(int i) {
    saveSaveGame("saveGame" + str(i) + ".json");
  }

  void loadSave(int i) {
    loadSaveGame("saveGame"+ str(i) + ".json");
  }

  void loadBaseFile() {    
    loadSaveGame("baseGame.json");
    reseMan.setupBaseResearch();
  }

  void displaySaveMenu() {
    for (int i = 0; i < 3; i++) {
      saveGames[i].updateSave();
    }
    for (int i = 0; i < 3; i++) {
      rectMode(CORNER);
      textSize(width*2/75);
      stroke(BLACK);
      if (mouseX > ((i+1)*width*1/4)-width/10 && mouseX < ((i+1)*width*1/4)+width/10 && mouseY > width/4 && mouseY < width*3/4) {
        fill(GREY);
      } else {
        fill(WHITE);
      }
      rect(((i+1)*width*1/4)-width/10, width*1/4, width*4/20, width*10/20);
      fill(BLACK);
      textAlign(CENTER, CENTER);
      text("Save " + str(i+1), (i+1)*width*1/4, width*9/32);
      textAlign(LEFT, CENTER);
      text(":" + saveGames[i].sTurn, (i+1)*width*1/4, width*11/32);
      text(":" + saveGames[i].sPops, (i+1)*width*1/4, width*13/32);
      text(":" + saveGames[i].sFood, (i+1)*width*1/4, width*15/32);
      text(":" + saveGames[i].sMinerals, (i+1)*width*1/4, width*17/32);
      text(":" + saveGames[i].sEnergy, (i+1)*width*1/4, width*19/32);
      text(":+" + saveGames[i].sResearch, (i+1)*width*1/4, width*21/32);
      //image(pTurn, ((i+1)*width*1/4)-width*1/16, width*11/32,width/20, width/20);
      image(pPop, ((i+1)*width*1/4)-width*1/16, width*25/64, width/20, width/20);
      image(pFood, ((i+1)*width*1/4)-width*1/16, width*29/64, width/20, width/20);
      image(pMineral, ((i+1)*width*1/4)-width*1/16, width*33/64, width/20, width/20);
      image(pEnergy, ((i+1)*width*1/4)-width*1/16, width*37/64, width/20, width/20);
      image(pResearch, ((i+1)*width*1/4)-width*1/16, width*41/64, width/20, width/20);
    }
    stroke(BLACK);
    rectMode(CENTER);
    if (mouseX > ((width*5/100)-width/40) && mouseX < ((width*5/100)+width/40) && mouseY > (height*5/100)-width/40 && mouseY < (height*5/100)+width/40) {
      fill(BLACK);
    } else {
      fill(WHITE);
    }
    rect(width*5/100, height*5/100, width/20, width/20);
    if (mouseX > ((width*5/100)-width/40) && mouseX < ((width*5/100)+width/40) && mouseY > (height*5/100)-width/40 && mouseY < (height*5/100)+width/40) {
      stroke(WHITE);
    } else {
      stroke(BLACK);
    }
    line((width*5/100)-width/120, height*5/100, (width*5/100)+10, height*5/100);
    triangle((width*5/100)-width/120, (height*5/100)-width/120, (width*5/100)-width/60, (height*5/100), (width*5/100)-width/120, (height*5/100)+width/120);
  }
}