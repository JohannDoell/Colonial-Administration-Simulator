class menu {
  String menuType;
  int menuState;
  boolean displayInGameMenu = false;
  boolean displayResearchMenu = false;
  boolean displayConstructionMenu = false;

  menu(String _menuType) {
    menuType = _menuType;
  }

  void displayMenu() {
    if (menuType == "Title") {
      if (menuState == 0) {
        stroke(0);
        // Title
        fill(GREY);
        rectMode(CENTER);
        rect(width*1/2, height*1/5, width*4/6, height*1/6);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Colonial Administration Simulator", width*1/2, height*1/5);

        // Play
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*2/5, 300, 80);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Play", width*1/2, height*2/5);

        // Load 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*3/5, 300, 80);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Load", width*1/2, height*3/5);

        // Options 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*4/5)-40 && mouseY < (height*4/5)+40) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*4/5, 300, 80);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Options", width*1/2, height*4/5);


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-15) && mouseX < ((width*95/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          fill(BLACK);
        } else {
          fill(WHITE);
        }
        rect(width*95/100, height*5/100, 30, 30);
        stroke(#FF0505);
        line((width*95/100)-10, (height*5/100)-10, (width*95/100)+10, (height*5/100)+10);
        line((width*95/100)+10, (height*5/100)-10, (width*95/100)-10, (height*5/100)+10);
      } else if (menuState == 1) {
        // Back Button
        stroke(BLACK);
        rectMode(CENTER);
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          fill(BLACK);
        } else {
          fill(WHITE);
        }
        rect(width*5/100, height*5/100, 30, 30);
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          stroke(WHITE);
        } else {
          stroke(BLACK);
        }
        line((width*5/100)-5, height*5/100, (width*5/100)+10, height*5/100);
        triangle((width*5/100)-5, (height*5/100)-5, (width*5/100)-10, (height*5/100), (width*5/100)-5, (height*5/100)+5);
      }
    } else if (menuType == "Research") {
      if (gmf.displayResearchMenu == true) {
        fill(BLACK);
        text("Research", width/2, height/2);
      }
    } else if (menuType == "Construction") {
      // Display Tiles
      if (gmf.displayConstructionMenu == true) {
        fill(BLACK);
        text("Construction", width/2, height/2);
        for (int i=0; i<tilesWide; i++) {
          for (int j=0; j<tilesHigh; j++) {
            buildingGrid[i][j].displayTile();
          }
        }
      }
      // Display Selected Tile
      fill(WHITE);
      rect(width*1/4, (height*11/16)+20, 100, 100);
      fill(BLACK);
      textSize(40);
      text(buildingGrid[selectedGridX][selectedGridY].tileChar, width*1/4, (height*11/16)+15);
      textSize(20);
      if (buildingGrid[selectedGridX][selectedGridY].tileType != 0) {
        text("Lvl." + buildingGrid[selectedGridX][selectedGridY].tileLevel, (width*1/4)-25, (height*11/16)+55);
      }
      textSize(12);
      if (buildingGrid[selectedGridX][selectedGridY].buildTime != 0) {
        text("Finished In:" + buildingGrid[selectedGridX][selectedGridY].buildTime, (width*1/4), (height*11/16)-20);
      }
      textSize(20);
      // Construction Options
      // Build
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)-30 && mouseY < (height*11/16) && buildingGrid[selectedGridX][selectedGridY].tileType == 0) { 
        fill(GREY);
      } else {
        fill(WHITE);
      }
      rect(width*1/2, (height*11/16)-15, 150, 30);
      fill(BLACK);
      text("BUILD", width*1/2, (height*11/16)-15);

      // Upgrade
      fill(WHITE);
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)+5 && mouseY < (height*11/16)+35 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
        if (buildingGrid[selectedGridX][selectedGridY].buildTime == 0 && buildingGrid[selectedGridX][selectedGridY].tileLevel != 3) {
          if (upgradeGate == false) {
            fill(GREY);
          } else {
            fill(DARKGREEN);
          }
        } else {
          if (upgradeGate == false) {
            fill(WHITE);
          } else {
            fill(GREEN);
          }
        }
      }
      rect(width*1/2, (height*11/16)+20, 150, 30);
      fill(BLACK);
      text("UPGRADE", width*1/2, (height*11/16)+20);
      
      //Demolish
      fill(WHITE);
      if (buildingGrid[selectedGridX][selectedGridY].buildTime == 0) {
        if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)+40 && mouseY < (height*11/16)+70 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
          if (demolishGate == false) {
            fill(GREY);
          } else {
            fill(DARKGREEN);
          }
        } else {
          if (demolishGate == false) {
            fill(WHITE);
          } else {
            fill(GREEN);
          }
        }
      }
      rect(width*1/2, (height*11/16)+55, 150, 30);
      fill(BLACK);
      text("DEMOLISH", width*1/2, (height*11/16)+55);
      //Hover Text
      //Upgrade
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)+5 && mouseY < (height*11/16)+35 && buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() != 0 && buildingGrid[selectedGridX][selectedGridY].buildTime == 0) { 
        rectMode(CORNER);
        fill(WHITE);
        rect(mouseX+10, mouseY, 150, 20);
        fill(BLACK);
        textAlign(LEFT);
        textSize(16);
        text("Cost: " + buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() + " Minerals", mouseX+10, mouseY+15);
        rectMode(CENTER);
        textAlign(CENTER);
      }
    } else if (menuType == "Game Menu Frame") {
      // Resource Menus
      stroke(BLACK); 
      line(0, height*1/16, width, height*1/16);
      fill(BLACK);
      textAlign(CENTER, CENTER);
      textSize(16);
      text("Pops " + pops + "+" + popIncrease, width*4/48, height*4/128);
      if (minerals == mineralMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      text("Minerals " + minerals + "+" + mineralIncrease, width*13/48, height*4/128);
      if (energy == energyMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      text("EUs " + energy + "+" + energyIncrease, width*23/48, height*4/128);
      if (food == foodMax) {
        fill(GREEN);
      } else if (food < 10 || food < pops) {
        fill(RED);
      } else {
        fill(BLACK);
      }
      text("Food " + food + "+" + foodIncrease, width*31/48, height*4/128);
      fill(BLACK);

      // InGame Option Menu
      rectMode(CENTER);
      stroke(BLACK); 
      fill(BLACK);
      textAlign(CENTER, CENTER);
      textSize(16);
      if (mouseX > (width)-(width*1/16) && mouseX < (width) && mouseY > 0 && mouseY < (height*1/16) || displayInGameMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect((width)-((width*1/16)/2), (height*1/16)/2, width*1/16, height*1/16);
      fill(WHITE);
      textSize(32);
      textAlign(CENTER, CENTER);
      text('=', (width)-((width*1/16)/2), ((height*1/16)/2)-5);
      textAlign(CENTER, CENTER);

      if (displayInGameMenu == true) {
        // Options
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)-height*1/16  && mouseY < (height*1/8) ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((width)-((width*1/8)/2), (height*1/8)-height*1/32, width*1/4, height*1/16);
        fill(WHITE);
        text("Options", (width)-((width*1/8)/2), (height*1/8)-height*1/32);
        // Save
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)  && mouseY < (height*1/8)+height*1/16 ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((width)-((width*1/8)/2), (height*1/8)+height*1/32, width*1/4, height*1/16);
        fill(WHITE);
        text("Save", (width)-((width*1/8)/2), (height*1/8)+height*1/32);
        // Quit
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)+height*1/16 && mouseY < (height*1/8)+height*1/8 ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((width)-((width*1/8)/2), (height*1/8)+height*3/32, width*1/4, height*1/16);
        fill(WHITE);
        text("Quit", (width)-((width*1/8)/2), (height*1/8)+height*3/32);
      }
      //Tabs
      line(0, height*14/16, width, height*14/16);

      // Research
      rectMode(CENTER);
      if (mouseX > 0 && mouseX < 300 && mouseY > height*14/16 && mouseY < height || gmf.displayResearchMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(width*1/4, height*15/16, 300, 75);
      rectMode(CENTER);

      // Construction
      rectMode(CENTER);
      if (mouseX > 300 && mouseX < 600 && mouseY > height*14/16 && mouseY < height || gmf.displayConstructionMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(width*3/4, height*15/16, 300, 75);
      rectMode(CENTER);

      fill(WHITE);
      textSize(32);
      text("Research", 150, height*15/16);
      text("Construction", 450, height*15/16);

      // Next Turn
      rectMode(CENTER);
      if (mouseX > width*54/64-(width*3/16)/2 && mouseX < width*54/64+(width*3/16)/2 && mouseY > height*1/32-height*1/16 && mouseY < height*1/32+height*1/16-10) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(width*54/64, height*1/32, width*3/16, height*1/16);
      fill(WHITE);
      textSize(16);
      text("TURN: " + turn, width*54/64, height*1/32);
    }
  }

  void menuClick() {
    if (menuType == "Title") {
      if (menuState == 0) {
        // Play
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          state = 1;
          turMan.setupBaseGame();
        }
        // Load 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
          // Load Functionality
        }
        // Options
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*4/5)-40 && mouseY < (height*4/5)+40) {
          menuState = 1;
        }


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-15) && mouseX < ((width*95/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          exit();
        }
      } else if (menuState == 1) {
        // Back Button
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          if (turn == 0) {
            menuState = 0;
          } else {
            menuState = 0;
            state = 1;
          }
        }
      }
    } else if (menuType == "Research") {
    } else if (menuType == "Construction") {
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          buildingGrid[i][j].selectTile();
        }
      }
      // Construction Options
      // Build
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)-30 && mouseY < (height*11/16)) {
      }
      // Upgrade
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)+5 && mouseY < (height*11/16)+35) {
        if (upgradeGate == false && buildingGrid[selectedGridX][selectedGridY].tileType != 0 && minerals >= buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() && buildingGrid[selectedGridX][selectedGridY].buildTime == 0 && buildingGrid[selectedGridX][selectedGridY].tileLevel != 3) {
          upgradeGate = true;
        } else if (upgradeGate == true) {
          upgradeGate = false;
          buildingGrid[selectedGridX][selectedGridY].upgradeTile();
        }
      }
      //Demolish
      if (mouseX > (width*1/2)-75 && mouseX < (width*1/2)+75 && mouseY > (height*11/16)+40 && mouseY < (height*11/16)+70) {
        if (demolishGate == false && buildingGrid[selectedGridX][selectedGridY].tileType != 0 && buildingGrid[selectedGridX][selectedGridY].buildTime == 0) {
          demolishGate = true;
        } else if (demolishGate == true) {
          buildingGrid[selectedGridX][selectedGridY].tileType = 0;
          demolishGate = false;
        }
      }
    } else if (menuType == "Game Menu Frame") {
      // In Game Menu
      if (mouseX > (width)-(height*1/16) && mouseX < (width) && mouseY > 0 && mouseY < (height*1/16)) {
        if (displayInGameMenu == true) {
          displayInGameMenu = false;
        } else {
          displayInGameMenu = true;
          displayResearchMenu = false;
          displayConstructionMenu = false;
          resetGates();
        }
      }

      if (displayInGameMenu == true) {
        // Main Menu
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)+height*1/16 && mouseY < (height*1/8)+height*1/8 ) {
          state = 0;
          titleMenu.menuState = 0;
          displayInGameMenu = false;
        }
        // Options
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)-height*1/16  && mouseY < (height*1/8) ) {
          state = 0;
          titleMenu.menuState = 1;
          displayInGameMenu = false;
        }
        //Research
      }
      if (mouseX > 0 && mouseX < 300 && mouseY > height*14/16 && mouseY < height ) {
        gmf.displayResearchMenu = !gmf.displayResearchMenu;
        gmf.displayConstructionMenu = false;
        resetGates();
      } 
      // Construction
      if (mouseX > 300 && mouseX < 600 && mouseY > height*14/16 && mouseY < height ) {
        gmf.displayConstructionMenu = !gmf.displayConstructionMenu;
        gmf.displayResearchMenu = false;
        demolishGate = false;
        buildGate = false;
        upgradeGate = false;
      }
      // Advance Turn
      if (mouseX > width*54/64-(width*3/16)/2 && mouseX < width*54/64+(width*3/16)/2 && mouseY > height*1/32-height*1/16 && mouseY < height*1/32+height*1/16-10) {
        turMan.advanceTurn();
      }
    }
  }

  void menuPress() {
    if (menuType == "Title") {
    } else if (menuType == "Research") {
    } else if (menuType == "Construction") {
    } else if (menuType == "Game Menu Frame") {
      // Press Spacebar to Advance Turn
      if (key == ' ') {
        turMan.advanceTurn();
      }
    }
  }

  void loseScreen() {
    fill(BLACK);
    textSize(64);
    text("YOU LOSE", width/2, height/2);
    textSize(20);
    text("You ran out of a resource", width/2, (height/2)+60);
  }

  void resetGates() {
    demolishGate = false;
    buildGate = false;
    upgradeGate = false;
  }
}