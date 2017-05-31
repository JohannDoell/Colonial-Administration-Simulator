class researchManager {
  boolean isResearching;
  int farmingProgress, buildTimeProgress, buildCostProgress, miningProgress, powerProgress, popProgress, researchProgress;
  int selection;
  researchManager() {
    isResearching = false;
  }

  void updateResearchBonuses() {
    foodResearchBonus = farmingProgress * 10;
    mineralResearchBonus = miningProgress * 10;
    energyResearchBonus = powerProgress * 10;
  }

  void selectResearch(int researchChoice) {
    if (researchChoice != 20) {
      selection = researchChoice;
      println(selection);
    }
  }

  void setupBaseResearch () {
    farmingProgress = 0;
    buildTimeProgress = 0;
    buildCostProgress = 0;
    miningProgress = 0;
    powerProgress = 0;
    popProgress = 0;
  }

  PImage getResearchIcon(int i) {
    if (i == 0) {
      return pFood;
    }
    if (i == 1) {
      return pNil;
    }
    if (i == 2) {
      return pNil;
    }
    if (i == 3) {
      return pMineral;
    }
    if (i == 4) {
      return pEnergy;
    }
    if (i == 5) {
      return pPop;
    }
    if (i == 6) {
      return pResearch;
    }
    return pNil;
  }

  String getResearchFlavourText(int i) {
    return researchTracks[i].flavourText;
  }

  void displayResearchObjects() {
    if (gmf.displayResearchMenu == true) {
      fill(WHITE);
      rectMode(CORNER);

      // Display Each Research Icon and Selection Button  

      for (int i = 0; i<7; i++) {
        fill(WHITE);          
        rect(width/20, width*8/60+width*6/64*i, width/6, width*1/12); 
        if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*8/60+width*6/64*i && mouseY < width*8/60+width*1/12+width*6/64*i) {
          fill(GREY);
        } else {
          fill(WHITE);
        }
        rect(width/4, width*8/60+width*6/64*i, width*2/3, width*1/12);
        fill(BLACK);
        imageMode(CENTER);
        textAlign(LEFT);
        image(resMan.getResearchIcon(i), width*21/160, width*21/120+width*6/64*i, width*1/20, width*1/20); 
        text(resMan.getResearchFlavourText(i), width*1/5+(width/6)/2, (width*1/12)/2+width*17/120+width*6/64*i);
        imageMode(CORNER);
        textAlign(CENTER, CENTER);
      }
      fill(BLACK);
      textSize(width*4/75);
      text("Research Value:" + researchIncrease, width*1/2, width*13/16);
      textAlign(CENTER, CENTER);
    }
  }

  int getResearchChoice() {
    for (int i = 0; i<7; i++) {
      if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*8/60+width*6/64*i && mouseY < width*8/60+width*1/12+width*6/64*i && gmf.displayResearchMenu == true) {
        return i;
      }
    }
    return -1;
  }
}