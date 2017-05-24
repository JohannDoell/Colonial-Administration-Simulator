class menu {
  String menuType;
  int menuState;
  boolean displayInGameMenu = false;
  boolean displayResearchMenu = false;
  boolean displayConstructionMenu = false;
  char desiredBuilding = 'N';

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
        rect(screenRatio*1/2, screenRatio*1/5, screenRatio*4/6, screenRatio*1/6);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(screenRatio/30);
        text("Colonial Administration Simulator", screenRatio*1/2, screenRatio*1/5);

        // Play
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((width*1/2)+screenRatio/4) && mouseY > (screenRatio*2/5)-screenRatio*1/15 && mouseY < (screenRatio*2/5)+screenRatio*1/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(screenRatio*1/2, screenRatio*2/5, screenRatio/2, screenRatio*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(screenRatio/24);
        text("Play", screenRatio*1/2, screenRatio*2/5);

        // Load 
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((screenRatio*1/2)+screenRatio/4) && mouseY > (screenRatio*3/5)-screenRatio/15 && mouseY < (screenRatio*3/5)+screenRatio/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(screenRatio*1/2, screenRatio*3/5, screenRatio/2, screenRatio*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(screenRatio/24);
        text("Load", screenRatio*1/2, screenRatio*3/5);

        // Options 
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((screenRatio*1/2)+screenRatio/4) && mouseY > (screenRatio*4/5)-screenRatio/15 && mouseY < (screenRatio*4/5)+screenRatio/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(screenRatio*1/2, screenRatio*4/5, screenRatio/2, screenRatio*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(screenRatio/24);
        text("Options", screenRatio*1/2, screenRatio*4/5);


        // Exit
        rectMode(CENTER);
        if (mouseX > ((screenRatio*95/100)-screenRatio/40) && mouseX < ((screenRatio*95/100)+screenRatio/40) && mouseY > (screenRatio*5/100)-screenRatio/40 && mouseY < (screenRatio*5/100)+screenRatio/40) {
          fill(BLACK);
        } else {
          fill(WHITE);
        }
        rect(screenRatio*95/100, screenRatio*5/100, screenRatio/20, screenRatio/20);
        stroke(#FF0505);
        line((screenRatio*95/100)-10, (screenRatio*5/100)-screenRatio/60, (screenRatio*95/100)+screenRatio/60, (screenRatio*5/100)+screenRatio/60);
        line((screenRatio*95/100)+10, (screenRatio*5/100)-screenRatio/60, (screenRatio*95/100)-screenRatio/60, (screenRatio*5/100)+screenRatio/60);
      } else if (menuState == 1) {
        fill(BLACK);
        text("Options Coming Soon", screenRatio/2, screenRatio/2);

        // Back Button
        stroke(BLACK);
        rectMode(CENTER);
        if (mouseX > ((screenRatio*5/100)-screenRatio/40) && mouseX < ((screenRatio*5/100)+screenRatio/40) && mouseY > (screenRatio*5/100)-screenRatio/40 && mouseY < (screenRatio*5/100)+screenRatio/40) {
          fill(BLACK);
        } else {
          fill(WHITE);
        }
        rect(width*5/100, height*5/100, width/20, width/20);
        if (screenRatio > ((screenRatio*5/100)-screenRatio/40) && mouseX < ((screenRatio*5/100)+screenRatio/40) && mouseY > (screenRatio*5/100)-screenRatio/40 && mouseY < (height*5/100)+screenRatio/40) {
          stroke(WHITE);
        } else {
          stroke(BLACK);
        }
        line((screenRatio*5/100)-screenRatio/120, screenRatio*5/100, (screenRatio*5/100)+10, screenRatio*5/100);
        triangle((screenRatio*5/100)-screenRatio/120, (screenRatio*5/100)-screenRatio/120, (screenRatio*5/100)-screenRatio/60, (screenRatio*5/100), (screenRatio*5/100)-screenRatio/120, (screenRatio*5/100)+screenRatio/120);
      }
    } else if (menuType == "Research") {
      if (gmf.displayResearchMenu == true) {
        fill(BLACK);
        text("Research Coming Soon", screenRatio/2, screenRatio/2);
        fill(WHITE);
        rectMode(CORNER);

        for (int i = 0; i<3; i++) {
          fill(WHITE);          
          rect(screenRatio/20, screenRatio*7/60+screenRatio/4*i, screenRatio/6, screenRatio/6); 
          if (mouseX > screenRatio/4 && mouseX < screenRatio*11/12 && mouseY > screenRatio*7/60+screenRatio/4*i && mouseY < screenRatio*17/60+screenRatio/4*i) {
            fill(GREY);
          } else {
            fill(WHITE);
          }
          rect(screenRatio/4, screenRatio*7/60+screenRatio/4*i, screenRatio*2/3, screenRatio/6);
          fill(BLACK);
          text(resMan.choices[i], screenRatio*2/15, screenRatio/5+screenRatio/4*i);
        }
        textAlign(CENTER, CENTER);
      }
    } else if (menuType == "Construction") {
      // Display Tiles
      if (gmf.displayConstructionMenu == true) {
        fill(BLACK);
        for (int i=0; i<tilesWide; i++) {
          for (int j=0; j<tilesHigh; j++) {
            buildingGrid[i][j].displayTile();
          }
        }
      }
      // Display Selected Tile
      fill(WHITE);
      rect(screenRatio*1/4, (screenRatio*11/16)+screenRatio/30, screenRatio/6, screenRatio/6);
      fill(BLACK);
      textSize(screenRatio/15);
      imageMode(CENTER);
      image(buildingGrid[selectedGridX][selectedGridY].getImage(), screenRatio*1/4, (screenRatio*11/16)+screenRatio/30, buildingGrid[0][0].tileWidth/2, buildingGrid[0][0].tileWidth/2);
      imageMode(CORNER);
      textSize(screenRatio/30);
      if (buildingGrid[selectedGridX][selectedGridY].tileType != 0) {
        text("Lvl." + buildingGrid[selectedGridX][selectedGridY].tileLevel, (screenRatio*1/4)-screenRatio/24, (screenRatio*11/16)+screenRatio*11/120);
      }
      textSize(screenRatio/50);
      if (buildingGrid[selectedGridX][selectedGridY].upgradeTime != 0) {
        text("Finished In:" + buildingGrid[selectedGridX][selectedGridY].upgradeTime, (screenRatio*1/4), (screenRatio*11/16)-screenRatio/30);
      }
      if (buildingGrid[selectedGridX][selectedGridY].buildTime != 0) {
        text("Finished In:" + buildingGrid[selectedGridX][selectedGridY].buildTime, (screenRatio*1/4), (screenRatio*11/16)-screenRatio/30);
      }
      textSize(screenRatio/30);

      // Construction Options
      // Build
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)-screenRatio/20 && mouseY < (screenRatio*11/16) && buildingGrid[selectedGridX][selectedGridY].tileType == 0) {
        if (buildingGrid[selectedGridX][selectedGridY].buildTime == 0) {
          if (buildGate == false) {
            fill(GREY);
          } else if (buildGate == true && desiredBuilding == 'N') {
            fill(RED);
          } else {
            fill(DARKGREEN);
          }
        }
      } else {
        if (buildGate == false) {
          fill(WHITE);
        } else {
          fill(GREEN);
        }
      }
      rect(screenRatio*1/2, (screenRatio*11/16)-screenRatio/40, screenRatio/4, screenRatio/20);
      fill(BLACK);
      text("BUILD", screenRatio*1/2, (screenRatio*11/16)-screenRatio/40);

      // Upgrade
      fill(WHITE);
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)+screenRatio/120 && mouseY < (screenRatio*11/16)+screenRatio*7/120 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
        if (buildingGrid[selectedGridX][selectedGridY].isConstructing() == false && buildingGrid[selectedGridX][selectedGridY].tileLevel != 3) {
          if (upgradeGate == false) {
            fill(GREY);
          } else {
            fill(DARKGREEN);
          }
        }
      } else {
        if (upgradeGate == false) {
          fill(WHITE);
        } else {
          fill(GREEN);
        }
      }
      rect(screenRatio*1/2, (screenRatio*11/16)+screenRatio/30, screenRatio/4, screenRatio/20);
      fill(BLACK);
      text("UPGRADE", screenRatio*1/2, (screenRatio*11/16)+screenRatio/30);

      //Demolish
      fill(WHITE);
      if (buildingGrid[selectedGridX][selectedGridY].isConstructing() == false) {
        if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)+screenRatio/15 && mouseY < (screenRatio*11/16)+screenRatio*7/60 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
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
      rect(screenRatio*1/2, (screenRatio*11/16)+screenRatio*11/120, screenRatio/4, screenRatio/20);
      fill(BLACK);
      text("DEMOLISH", screenRatio*1/2, (screenRatio*11/16)+screenRatio*11/120);

      // Building Menu 
      rectMode(CORNER);
      fill(WHITE);
      rect((screenRatio*11/16)-screenRatio/60, (screenRatio*5/8)+screenRatio/75, screenRatio/6, screenRatio/6);
      if (buildGate == true || buildingGrid[selectedGridX][selectedGridY].tileType == 0) {
        //Food
        if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true || desiredBuilding == 'F') {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((screenRatio*11/16)-screenRatio/60, (screenRatio*5/8)+screenRatio/75, screenRatio/12, screenRatio/12);

        //Research
        if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+screenRatio*3/20 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true || desiredBuilding == 'R') {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((screenRatio*11/16)+screenRatio/15, (screenRatio*5/8)+screenRatio/75, screenRatio/12, screenRatio/12);

        //Power
        if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true || desiredBuilding == 'P') {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((screenRatio*11/16)-screenRatio/60, (screenRatio*5/8)+screenRatio*29/300, screenRatio/12, screenRatio/12);

        //Mineral
        if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+width*3/20 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true || desiredBuilding == 'M') {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((screenRatio*11/16)+screenRatio/15, (screenRatio*5/8)+screenRatio*29/300, screenRatio/12, screenRatio/12);

        fill(BLACK);

        text('F', (screenRatio*11/16)+screenRatio/40, (screenRatio*5/8)+screenRatio*11/200);
        text('R', (screenRatio*11/16)+screenRatio*13/120, (screenRatio*5/8)+screenRatio*11/200);
        text('P', (screenRatio*11/16)+screenRatio/40, (screenRatio*5/8)+screenRatio*83/600);
        text('M', (screenRatio*11/16)+screenRatio*13/120, (screenRatio*5/8)+screenRatio*83/600);
      }

      //Hover Text

      // Needs Fixing

      //Build
      rectMode(CORNER);
      fill(WHITE);
      //Food
      if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true) {
        rect(mouseX+screenRatio/60, mouseY, screenRatio/4, screenRatio/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+screenRatio*9/100, mouseY+screenRatio/200, screenRatio/40, screenRatio/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('F'), mouseX+screenRatio/60, mouseY+screenRatio/40);
      }

      //Research
      if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+screenRatio*3/20 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true) {
        rect(mouseX+screenRatio/60, mouseY, screenRatio/4, screenRatio/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+screenRatio*9/100, mouseY+screenRatio/200, screenRatio/40, screenRatio/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('R'), mouseX+screenRatio/60, mouseY+screenRatio/40);
      }

      //Power
      if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true) {
        rect(mouseX+screenRatio/60, mouseY, screenRatio/4, screenRatio/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+screenRatio*9/100, mouseY+screenRatio/200, screenRatio/40, screenRatio/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('P'), mouseX+screenRatio/60, mouseY+screenRatio/40);
      }

      //Mineral
      if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+screenRatio*3/20 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true) {
        rect(mouseX+screenRatio/60, mouseY, screenRatio/4, screenRatio/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+screenRatio*9/100, mouseY+screenRatio/200, screenRatio/40, screenRatio/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('M'), mouseX+screenRatio/60, mouseY+screenRatio/40);
      }
      rectMode(CENTER);
      textAlign(CENTER);

      //Upgrade
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)+screenRatio/120 && mouseY < (screenRatio*11/16)+screenRatio*7/120 && buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() != 0 && buildingGrid[selectedGridX][selectedGridY].isConstructing() == false) { 
        rectMode(CORNER);
        fill(WHITE);
        rect(mouseX+screenRatio/60, mouseY, screenRatio/4, screenRatio/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+screenRatio*9/100, mouseY+screenRatio/200, screenRatio/40, screenRatio/40);
        text("Cost:     " + buildingGrid[selectedGridX][selectedGridY].getUpgradeCost(), mouseX+screenRatio*11/600, mouseY+screenRatio/40);
        rectMode(CENTER);
        textAlign(CENTER);
      }
    } else if (menuType == "Game Menu Frame") {
      // Resource Menus
      stroke(BLACK); 
      line(0, screenRatio*1/16, screenRatio, screenRatio*1/16);
      fill(BLACK);
      textAlign(RIGHT, CENTER);
      textSize(screenRatio*2/75);
      // Pops
      image(pPop, screenRatio*2/48, screenRatio*2/128, 20, 20);
      text(pops + "+" + popIncrease, screenRatio*7/48, height*4/128);
      if (mineralIncrease < 0) {
        fill(RED);
      } else if (minerals == mineralMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      // Minerals
      image(pMineral, screenRatio*11/48, screenRatio*2/128, screenRatio/30, screenRatio/30);
      if (minerals <= 1000) {
        text(minerals + "+" + mineralIncrease, screenRatio*18/48, screenRatio*4/128);
      }
      if (minerals >= 1000 && mineralIncrease <= 1000) {
        text(minerals/1000 + "K+" + mineralIncrease, screenRatio*18/48, screenRatio*4/128);
      }
      if (minerals >= 1000 && mineralIncrease >= 1000) {
        text(minerals/1000 + "K+" + mineralIncrease/1000 + "K", screenRatio*18/48, screenRatio*4/128);
      }
      if (energyIncrease < 0) {
        fill(RED);
      } else if (energy == energyMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      // Energy
      image(pEnergy, screenRatio*20/48, screenRatio*2/128, screenRatio/30,screenRatio/30);
      if (energy < 1000) {
        text(energy + "+" + energyIncrease, screenRatio*26/48, screenRatio*4/128);
      }
      if (energy >= 1000 && energyIncrease <= 1000) {
        text(energy/1000 + "K+" + energyIncrease, screenRatio*26/48, screenRatio*4/128);
      }
      if (energy >= 1000 && energyIncrease >= 1000) {
        text(energy/1000 + "K+" + energyIncrease/1000 + "K", screenRatio*26/48, screenRatio*4/128);
      }

      if (food < 10 || food < pops || foodIncrease < 0) {
        fill(RED);
      } else if (food == foodMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      //Food
      image(pFood, screenRatio*28/48, screenRatio*2/128, screenRatio/30, screenRatio/30);
      text(food + "+" + foodIncrease, screenRatio*34/48, screenRatio*4/128);
      fill(BLACK);

      // InGame Option Menu
      rectMode(CENTER);
      stroke(BLACK); 
      fill(BLACK);
      textAlign(CENTER, CENTER);
      textSize(screenRatio*2/75);
      if (mouseX > (screenRatio)-(screenRatio*1/16) && mouseX < (screenRatio) && mouseY > 0 && mouseY < (screenRatio*1/16) || displayInGameMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect((screenRatio)-((screenRatio*1/16)/2), (screenRatio*1/16)/2, screenRatio*1/16, screenRatio*1/16);
      fill(WHITE);
      textSize(width*4/75);
      textAlign(CENTER, CENTER);
      text('=', (screenRatio)-((screenRatio*1/16)/2), ((screenRatio*1/16)/2)-screenRatio/120);
      textAlign(CENTER, CENTER);

      if (displayInGameMenu == true) {
        // Options
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(width*2/75);
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)-screenRatio*1/16  && mouseY < (screenRatio*1/8) ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)-screenRatio*1/32, screenRatio*1/4, screenRatio*1/16);
        fill(WHITE);
        text("Options", (screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)-screenRatio*1/32);
        // Save
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(width*2/75);
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)  && mouseY < (screenRatio*1/8)+screenRatio*1/16 ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)+screenRatio*1/32, screenRatio*1/4, screenRatio*1/16);
        fill(WHITE);
        text("Save", (screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)+screenRatio*1/32);
        // Quit
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(width*2/75);
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)+screenRatio*1/16 && mouseY < (screenRatio*1/8)+screenRatio*1/8 ) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rect((screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)+screenRatio*3/32, screenRatio*1/4, screenRatio*1/16);
        fill(WHITE);
        text("Quit", (screenRatio)-((screenRatio*1/8)/2), (screenRatio*1/8)+screenRatio*3/32);
      }
      //Tabs
      line(0, screenRatio*14/16, screenRatio, screenRatio*14/16);

      // Research
      rectMode(CENTER);
      if (mouseX > 0 && mouseX < 300 && mouseY > screenRatio*14/16 && mouseY < screenRatio || gmf.displayResearchMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(screenRatio*1/4, screenRatio*15/16, screenRatio/2, screenRatio/8);
      rectMode(CENTER);

      // Construction
      rectMode(CENTER);
      if (mouseX > screenRatio/2 && mouseX < screenRatio && mouseY > screenRatio*14/16 && mouseY < screenRatio || gmf.displayConstructionMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(screenRatio*3/4, screenRatio*15/16, screenRatio/2, screenRatio/8);
      rectMode(CENTER);

      fill(WHITE);
      textSize(screenRatio*4/75);
      text("Research", screenRatio/4, screenRatio*15/16);
      text("Construction", screenRatio*3/4, screenRatio*15/16);

      // Next Turn
      rectMode(CENTER);
      if (mouseX > screenRatio*54/64-(screenRatio*3/16)/2 && mouseX < screenRatio*54/64+(screenRatio*3/16)/2 && mouseY > screenRatio*1/32-screenRatio*1/16 && mouseY < screenRatio*1/32+screenRatio*1/16-screenRatio/60) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(screenRatio*54/64, screenRatio*1/32, screenRatio*3/16, screenRatio*1/16);
      fill(WHITE);
      textSize(screenRatio*2/75);
      text("TURN: " + turn, screenRatio*54/64, screenRatio*1/32);
    }
  }

  void menuClick() {
    if (menuType == "Title") {
      if (menuState == 0) {
        // Play
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((screenRatio*1/2)+screenRatio/4) && mouseY > (screenRatio*2/5)-screenRatio/15 && mouseY < (screenRatio*2/5)+screenRatio/15) {
          state = 1;
          turMan.setupBaseGame();
        }
        // Load 
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((screenRatio*1/2)+screenRatio/4) && mouseY > (screenRatio*3/5)-screenRatio/15 && mouseY < (screenRatio*3/5)+screenRatio/15) {
          gameFileMan.loadSave();
          state = 1;
        }
        // Options
        if (mouseX > ((screenRatio*1/2)-screenRatio/4) && mouseX < ((screenRatio*1/2)+screenRatio/4) && mouseY > (screenRatio*4/5)-screenRatio/15 && mouseY < (screenRatio*4/5)+screenRatio/15) {
          menuState = 1;
        }


        // Exit
        rectMode(CENTER);
        if (mouseX > ((screenRatio*95/100)-15) && mouseX < ((screenRatio*95/100)+15) && mouseY > (screenRatio*5/100)-15 && mouseY < (screenRatio*5/100)+15) {
          exit();
        }
      } else if (menuState == 1) {
        // Back Button
        if (mouseX > ((screenRatio*5/100)-screenRatio/40) && mouseX < ((screenRatio*5/100)+screenRatio/40) && mouseY > (screenRatio*5/100)-screenRatio/40 && mouseY < (screenRatio*5/100)+screenRatio/40) {
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

      //Building Grid
      for (int i=0; i<tilesWide; i++) {
        for (int j=0; j<tilesHigh; j++) {
          buildingGrid[i][j].selectTile();
        }
      }
      // Construction Options
      // Build
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)-screenRatio/20 && mouseY < (screenRatio*11/16)) {
        if (upgradeGate == false && buildingGrid[selectedGridX][selectedGridY].tileType == 0 && desiredBuilding == 'N') {
          resetGates();
          buildGate = true;
        } else if (buildGate == true && desiredBuilding != 'N' && minerals >= buildingGrid[selectedGridX][selectedGridY].getBuildCost(desiredBuilding)) {
          buildingGrid[selectedGridX][selectedGridY].buildTile(desiredBuilding);
          desiredBuilding = 'N';
          resetGates();
        }
      }
      // Upgrade
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)+screenRatio/120 && mouseY < (screenRatio*11/16)+screenRatio*7/120) {
        if (upgradeGate == false && buildingGrid[selectedGridX][selectedGridY].tileType != 0 && minerals >= buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() && buildingGrid[selectedGridX][selectedGridY].isConstructing() == false && buildingGrid[selectedGridX][selectedGridY].tileLevel != 3) {
          resetGates();
          upgradeGate = true;
        } else if (upgradeGate == true) {
          upgradeGate = false;
          buildingGrid[selectedGridX][selectedGridY].upgradeTile();
        }
      }
      //Demolish
      if (mouseX > (screenRatio*1/2)-screenRatio/8 && mouseX < (screenRatio*1/2)+screenRatio/8 && mouseY > (screenRatio*11/16)+screenRatio/15 && mouseY < (screenRatio*11/16)+screenRatio*7/60) {
        if (demolishGate == false && buildingGrid[selectedGridX][selectedGridY].tileType != 0 && buildingGrid[selectedGridX][selectedGridY].isConstructing() == false) {
          resetGates();
          demolishGate = true;
        } else if (demolishGate == true) {
          buildingGrid[selectedGridX][selectedGridY].tileType = 0;
          demolishGate = false;
        }
      }

      //Building Menu
      //Food
      if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true) {
        if (desiredBuilding != 'F') {
          desiredBuilding = 'F';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Research
      if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+screenRatio*3/20 && mouseY > (screenRatio*5/8)+screenRatio/75 && mouseY < (screenRatio*5/8)+screenRatio*29/300 && buildGate == true) {
        if (desiredBuilding != 'R') {
          desiredBuilding = 'R';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Power
      if (mouseX > (screenRatio*11/16)-screenRatio/60 && mouseX <(screenRatio*11/16)+screenRatio/15 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true) {
        if (desiredBuilding != 'P') {
          desiredBuilding = 'P';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Mineral
      if (mouseX > (screenRatio*11/16)+screenRatio/15 && mouseX <(screenRatio*11/16)+screenRatio*3/20 && mouseY > (screenRatio*5/8)+screenRatio*29/300 && mouseY < (screenRatio*5/8)+screenRatio*9/50 && buildGate == true) {
        if (desiredBuilding != 'M') {
          desiredBuilding = 'M';
        } else {
          desiredBuilding = 'N';
        }
      }
    } else if (menuType == "Game Menu Frame") {
      // In Game Menu
      if (mouseX > (screenRatio)-(screenRatio*1/16) && mouseX < (screenRatio) && mouseY > 0 && mouseY < (screenRatio*1/16)) {
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
        // Save
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)  && mouseY < (screenRatio*1/8)+screenRatio*1/16 ) {
          gameFileMan.saveSave();
        }
        // Main Menu
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)+screenRatio*1/16 && mouseY < (screenRatio*1/8)+screenRatio*1/8 ) {
          state = 0;
          titleMenu.menuState = 0;
          displayInGameMenu = false;
        }
        // Options
        if (mouseX > (screenRatio)-(screenRatio*1/4) && mouseX < screenRatio && mouseY > (screenRatio*1/8)-screenRatio*1/16  && mouseY < (screenRatio*1/8) ) {
          state = 0;
          titleMenu.menuState = 1;
          displayInGameMenu = false;
        }
        //Research
      }
      if (mouseX > 0 && mouseX < screenRatio/2 && mouseY > screenRatio*14/16 && mouseY < screenRatio ) {
        gmf.displayResearchMenu = !gmf.displayResearchMenu;
        gmf.displayConstructionMenu = false;
        resetGates();
      } 
      // Construction
      if (mouseX > screenRatio/2 && mouseX < screenRatio && mouseY > screenRatio*14/16 && mouseY < screenRatio ) {
        gmf.displayConstructionMenu = !gmf.displayConstructionMenu;
        gmf.displayResearchMenu = false;
        resetGates();
      }
      // Advance Turn
      if (mouseX > screenRatio*54/64-(screenRatio*3/16)/2 && mouseX < screenRatio*54/64+(screenRatio*3/16)/2 && mouseY > screenRatio*1/32-screenRatio*1/16 && mouseY < screenRatio*1/32+screenRatio*1/16-screenRatio/60) {
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
    textSize(width*8/75);
    text("YOU LOSE", width/2, height/2);
    textSize(width/30);
    text("You ran out of a resource", width/2, (height/2)+width/10);
  }


  // Resets the confirmation gates for all construction actions.
  void resetGates() {
    demolishGate = false;
    buildGate = false;
    upgradeGate = false;
  }
}