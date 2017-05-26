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
        rect(width*1/2, height*1/5, width*4/6, height*1/6);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(width/30);
        text("Colonial Administration Simulator", width*1/2, height*1/5);

        // Play
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*2/5)-width*1/15 && mouseY < (height*2/5)+width*1/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*2/5, width/2, width*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(width/24);
        text("Play", width*1/2, height*2/5);

        // Load 
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*3/5)-width/15 && mouseY < (height*3/5)+width/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*3/5, width/2, width*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(width/24);
        text("Load", width*1/2, height*3/5);

        // Options 
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*4/5)-width/15 && mouseY < (height*4/5)+width/15) {
          fill(BLACK);
        } else {
          fill(GREY);
        }
        rectMode(CENTER);
        rect(width*1/2, height*4/5, width/2, width*2/15);
        fill(WHITE);
        textAlign(CENTER, CENTER);
        textSize(width/24);
        text("Options", width*1/2, height*4/5);


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-width/40) && mouseX < ((width*95/100)+width/40) && mouseY > (height*5/100)-width/40 && mouseY < (height*5/100)+width/40) {
          fill(BLACK);
        } else {
          fill(WHITE);
        }
        rect(width*95/100, height*5/100, width/20, width/20);
        imageMode(CENTER);
        image(pX, width*95/100, height*5/100, width/25, width/25);
        imageMode(CORNER);
        //line((width*95/100)-10, (height*5/100)-width/60, (width*95/100)+width/60, (height*5/100)+width/60);
      } else if (menuState == 1) {
        fill(BLACK);
        text("Options Coming Soon", width/2, height/2);

        // Back Button
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
    } else if (menuType == "Research") {
      if (gmf.displayResearchMenu == true) {
        fill(BLACK);
        text("Research Coming Soon", width/2, height/2);
        fill(WHITE);
        rectMode(CORNER);

        for (int i = 0; i<3; i++) {
          fill(WHITE);          
          rect(width/20, width*7/60+width*12/64*i, width/6, width/6); 
          if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*7/60+width*12/64*i && mouseY < width*7/60+width/6+width*12/64*i) {
            fill(GREY);
          } else {
            fill(WHITE);
          }
          rect(width/4, width*7/60+width*12/64*i, width*2/3, width/6);
          fill(BLACK);
          text(resMan.choices[i], width*2/15, width/5+width*12/64*i);
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
      rect(width*1/4, (height*11/16)+width/30, width/6, width/6);
      fill(BLACK);
      textSize(width/15);
      imageMode(CENTER);
      image(buildingGrid[selectedGridX][selectedGridY].getImage(), width*1/4, (height*11/16)+width/30, buildingGrid[0][0].tileWidth/2, buildingGrid[0][0].tileWidth/2);
      imageMode(CORNER);
      textSize(width/30);
      if (buildingGrid[selectedGridX][selectedGridY].tileType != 0) {
        text("Lvl." + buildingGrid[selectedGridX][selectedGridY].tileLevel, (width*1/4)-width/24, (height*11/16)+width*11/120);
      }
      textSize(width/50);
      if (buildingGrid[selectedGridX][selectedGridY].upgradeTime != 0) {
        text("Finished In:" + buildingGrid[selectedGridX][selectedGridY].upgradeTime, (width*1/4), (height*11/16)-width/30);
      }
      if (buildingGrid[selectedGridX][selectedGridY].buildTime != 0) {
        text("Finished In:" + buildingGrid[selectedGridX][selectedGridY].buildTime, (width*1/4), (height*11/16)-width/30);
      }
      textSize(width/30);

      // Construction Options
      // Build
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)-width/20 && mouseY < (height*11/16) && buildingGrid[selectedGridX][selectedGridY].tileType == 0) {
        if (buildingGrid[selectedGridX][selectedGridY].buildTime == 0) {
          if (buildGate == false) {
            fill(GREY);
          } else if (buildGate == true && desiredBuilding == 'N' || minerals < buildingGrid[selectedGridX][selectedGridY].getBuildCost(desiredBuilding)) {
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
      rect(width*1/2, (height*11/16)-width/40, width/4, width/20);
      fill(BLACK);
      text("BUILD", width*1/2, (height*11/16)-width/40);

      // Upgrade
      fill(WHITE);
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)+width/120 && mouseY < (height*11/16)+width*7/120 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
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
      rect(width*1/2, (height*11/16)+width/30, width/4, width/20);
      fill(BLACK);
      text("UPGRADE", width*1/2, (height*11/16)+width/30);

      //Demolish
      fill(WHITE);
      if (buildingGrid[selectedGridX][selectedGridY].isConstructing() == false) {
        if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)+width/15 && mouseY < (height*11/16)+width*7/60 && buildingGrid[selectedGridX][selectedGridY].tileType != 0) { 
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
      rect(width*1/2, (height*11/16)+width*11/120, width/4, width/20);
      fill(BLACK);
      text("DEMOLISH", width*1/2, (height*11/16)+width*11/120);

      // Building Menu 
      rectMode(CORNER);
      fill(WHITE);
      rect((width*11/16)-width/60, (height*5/8)+width/75, width/6, width/6);
      if (buildGate == true || buildingGrid[selectedGridX][selectedGridY].tileType == 0) {
        //Food
        if (desiredBuilding == 'F') {
          fill(DARKGREY);
        } else if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((width*11/16)-width/60, (height*5/8)+width/75, width/12, width/12);

        //Research
        if (desiredBuilding == 'R') {
          fill(DARKGREY);
        } else if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((width*11/16)+width/15, (height*5/8)+width/75, width/12, width/12);

        //Power
        if (desiredBuilding == 'P') {
          fill(DARKGREY);
        } else if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((width*11/16)-width/60, (height*5/8)+width*29/300, width/12, width/12);

        //Mineral
        if (desiredBuilding == 'M') {
          fill(DARKGREY);
        } else if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect((width*11/16)+width/15, (height*5/8)+width*29/300, width/12, width/12);

        fill(BLACK);

        text('F', (width*11/16)+width/40, (height*5/8)+width*11/200);
        text('R', (width*11/16)+width*13/120, (height*5/8)+width*11/200);
        text('P', (width*11/16)+width/40, (height*5/8)+width*83/600);
        text('M', (width*11/16)+width*13/120, (height*5/8)+width*83/600);
      }

      //Hover Text

      //Build
      rectMode(CORNER);
      fill(WHITE);
      //Food
      if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
        rect(mouseX+width/60, mouseY, width/4, width/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+width*9/100, mouseY+width/200, width/40, width/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('F'), mouseX+width/60, mouseY+width/40);
      }

      //Research
      if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
        rect(mouseX+width/60, mouseY, width/4, width/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+width*9/100, mouseY+width/200, width/40, width/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('R'), mouseX+width/60, mouseY+width/40);
      }

      //Power
      if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
        rect(mouseX+width/60, mouseY, width/4, width/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+width*9/100, mouseY+width/200, width/40, width/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('P'), mouseX+width/60, mouseY+width/40);
      }

      //Mineral
      if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
        rect(mouseX+width/60, mouseY, width/4, width/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+width*9/100, mouseY+width/200, width/40, width/40);
        text("Cost:    " + buildingGrid[selectedGridX][selectedGridY].getBuildCost('M'), mouseX+width/60, mouseY+width/40);
      }
      rectMode(CENTER);
      textAlign(CENTER);

      //Upgrade
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)+width/120 && mouseY < (height*11/16)+width*7/120 && buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() != 0 && buildingGrid[selectedGridX][selectedGridY].isConstructing() == false) { 
        rectMode(CORNER);
        fill(WHITE);
        rect(mouseX+width/60, mouseY, width/4, width/30);
        fill(BLACK);
        textAlign(LEFT);
        textSize(width*2/75);
        image(pMineral, mouseX+width*9/100, mouseY+width/200, width/40, width/40);
        text("Cost:     " + buildingGrid[selectedGridX][selectedGridY].getUpgradeCost(), mouseX+width*11/600, mouseY+width/40);
        rectMode(CENTER);
        textAlign(CENTER);
      }
    } else if (menuType == "Game Menu Frame") {
      // Resource Menus
      stroke(BLACK); 
      line(0, height*1/16, width, height*1/16);
      fill(BLACK);
      textAlign(RIGHT, CENTER);
      textSize(width*2/75);
      // Pops
      image(pPop, width*2/48, height*2/128, 20, 20);
      text(pops, width*7/48, height*4/128);
      if (mineralIncrease < 0) {
        fill(RED);
      } else if (minerals == mineralMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      // Minerals
      image(pMineral, width*11/48, height*2/128, width/30, width/30);
      if (minerals <= 1000) {
        text(minerals + "+" + mineralIncrease, width*18/48, height*4/128);
      }
      if (minerals >= 1000 && mineralIncrease <= 1000) {
        text(minerals/1000 + "K+" + mineralIncrease, width*18/48, height*4/128);
      }
      if (minerals >= 1000 && mineralIncrease >= 1000) {
        text(minerals/1000 + "K+" + mineralIncrease/1000 + "K", width*18/48, height*4/128);
      }
      if (energyIncrease < 0) {
        fill(RED);
      } else if (energy == energyMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      // Energy
      image(pEnergy, width*20/48, height*2/128, width/30, width/30);
      if (energy < 1000) {
        text(energy + "+" + energyIncrease, width*53/96, height*4/128);
      }
      if (energy >= 1000 && energyIncrease <= 1000) {
        text(energy/1000 + "K+" + energyIncrease, width*53/96, height*4/128);
      }
      if (energy >= 1000 && energyIncrease >= 1000) {
        text(energy/1000 + "K+" + energyIncrease/1000 + "K", width*53/96, height*4/128);
      }

      if (food < 10 || food < pops && foodIncrease < 1 || foodIncrease < 0) {
        fill(RED);
      } else if (food == foodMax) {
        fill(GREEN);
      } else {
        fill(BLACK);
      }
      //Food
      image(pFood, width*28/48, height*2/128, width/30, width/30);
      text(food + "+" + foodIncrease, width*34/48, height*4/128);
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
      textSize(width*4/75);
      textAlign(CENTER, CENTER);
      text('=', (width)-((width*1/16)/2), ((height*1/16)/2)-width/120);
      textAlign(CENTER, CENTER);

      if (displayInGameMenu == true) {
        // Options
        stroke(BLACK); 
        fill(BLACK);
        textAlign(CENTER, CENTER);
        textSize(width*2/75);
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
        textSize(width*2/75);
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
        textSize(width*2/75);
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
      rect(width*1/4, height*15/16, width/2, width/8);
      rectMode(CENTER);

      // Construction
      rectMode(CENTER);
      if (mouseX > width/2 && mouseX < width && mouseY > height*14/16 && mouseY < height || gmf.displayConstructionMenu == true) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(width*3/4, height*15/16, width/2, width/8);
      rectMode(CENTER);

      fill(WHITE);
      textSize(width*4/75);
      text("Research", width/4, height*15/16);
      text("Construction", width*3/4, height*15/16);

      // Next Turn
      rectMode(CENTER);
      if (mouseX > width*54/64-(width*3/16)/2 && mouseX < width*54/64+(width*3/16)/2 && mouseY > height*1/32-height*1/16 && mouseY < height*1/32+height*1/16-width/60) {
        fill(BLACK);
      } else {
        fill(GREY);
      }
      rect(width*54/64, height*1/32, width*3/16, height*1/16);
      fill(WHITE);
      textSize(width*2/75);
      text("TURN: " + turn, width*54/64, height*1/32);
    }
  }

  void menuClick() {
    if (menuType == "Title") {
      if (menuState == 0) {
        // Play
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*2/5)-width/15 && mouseY < (height*2/5)+width/15) {
          state = 1;
          turMan.setupBaseGame();
        }
        // Load 
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*3/5)-width/15 && mouseY < (height*3/5)+width/15) {
          gameFileMan.loadSave();
          state = 1;
        }
        // Options
        if (mouseX > ((width*1/2)-width/4) && mouseX < ((width*1/2)+width/4) && mouseY > (height*4/5)-width/15 && mouseY < (height*4/5)+width/15) {
          menuState = 1;
        }


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-15) && mouseX < ((width*95/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          exit();
        }
      } else if (menuState == 1) {
        // Back Button
        if (mouseX > ((width*5/100)-width/40) && mouseX < ((width*5/100)+width/40) && mouseY > (height*5/100)-width/40 && mouseY < (height*5/100)+width/40) {
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
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)-width/20 && mouseY < (height*11/16)) {
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
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)+width/120 && mouseY < (height*11/16)+width*7/120) {
        if (upgradeGate == false && buildingGrid[selectedGridX][selectedGridY].tileType != 0 && minerals >= buildingGrid[selectedGridX][selectedGridY].getUpgradeCost() && buildingGrid[selectedGridX][selectedGridY].isConstructing() == false && buildingGrid[selectedGridX][selectedGridY].tileLevel != 3) {
          resetGates();
          upgradeGate = true;
        } else if (upgradeGate == true) {
          upgradeGate = false;
          buildingGrid[selectedGridX][selectedGridY].upgradeTile();
        }
      }
      //Demolish
      if (mouseX > (width*1/2)-width/8 && mouseX < (width*1/2)+width/8 && mouseY > (height*11/16)+width/15 && mouseY < (height*11/16)+width*7/60) {
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
      if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
        if (desiredBuilding != 'F') {
          desiredBuilding = 'F';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Research
      if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width/75 && mouseY < (height*5/8)+width*29/300 && buildGate == true) {
        if (desiredBuilding != 'R') {
          desiredBuilding = 'R';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Power
      if (mouseX > (width*11/16)-width/60 && mouseX <(width*11/16)+width/15 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
        if (desiredBuilding != 'P') {
          desiredBuilding = 'P';
        } else {
          desiredBuilding = 'N';
        }
      }

      //Mineral
      if (mouseX > (width*11/16)+width/15 && mouseX <(width*11/16)+width*3/20 && mouseY > (height*5/8)+width*29/300 && mouseY < (height*5/8)+width*9/50 && buildGate == true) {
        if (desiredBuilding != 'M') {
          desiredBuilding = 'M';
        } else {
          desiredBuilding = 'N';
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
        // Save
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)  && mouseY < (height*1/8)+height*1/16 ) {
          gameFileMan.saveSave();
        }
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
      if (mouseX > 0 && mouseX < width/2 && mouseY > height*14/16 && mouseY < height ) {
        gmf.displayResearchMenu = !gmf.displayResearchMenu;
        gmf.displayConstructionMenu = false;
        resetGates();
      } 
      // Construction
      if (mouseX > width/2 && mouseX < width && mouseY > height*14/16 && mouseY < height ) {
        gmf.displayConstructionMenu = !gmf.displayConstructionMenu;
        gmf.displayResearchMenu = false;
        resetGates();
      }
      // Advance Turn
      if (mouseX > width*54/64-(width*3/16)/2 && mouseX < width*54/64+(width*3/16)/2 && mouseY > height*1/32-height*1/16 && mouseY < height*1/32+height*1/16-width/60) {
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