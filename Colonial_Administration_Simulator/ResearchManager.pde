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
    if (researchChoice != -1) {
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
    for (int i=0; i<7; i++) {
      researchTracks[i].setResearchMenuVariables();
    }
  }

  PImage getResearchIcon(int i) {
    if (i == 0) {
      return pFood;
    }
    if (i == 1) {
      return pClock;
    }
    if (i == 2) {
      return pHammer;
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
      fill(BLACK);
      textSize(width*4/75);
      textAlign(CENTER, CENTER);
      image(pResearch, width*80/200, width*126/160, width*13/200, width*13/200);
      text("+" + researchIncrease, width*1/2, width*13/16);
      textSize(width*2/75);

      for (int i = 0; i<7; i++) {
        fill(WHITE);          
        rect(width/20, width*8/60+width*6/64*i, width/6, width*1/12); 
        if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*8/60+width*6/64*i && mouseY < width*8/60+width*1/12+width*6/64*i) {
          fill(GREY);
        } else if (selection == i) {
          fill(LIGHTGREY);
        } else {
          fill(WHITE);
        }
        rect(width/4, width*8/60+width*6/64*i, width*2/3, width*1/12);
        fill(BLACK);
        imageMode(CENTER);
        textAlign(LEFT);
        image(reseMan.getResearchIcon(i), width*21/160, width*21/120+width*6/64*i, width*1/20, width*1/20); 
        if (researchTracks[i].progress != 4) {
          text(reseMan.getResearchFlavourText(i) + " : " + researchTracks[i].researchTime + " / " + researchTracks[i].totalResearchTime, width*160/600, (width*1/12)/2+width*17/120+width*6/64*i);
        } else {
          text("Finished", width*160/600, (width*1/12)/2+width*17/120+width*6/64*i);
        }


        if (i == 5) {
          text("-" + researchTracks[i].getBonus(0) + "%⇨-" + researchTracks[i].getBonus(1) + "%", width*440/600, (width*1/12)/2+width*17/120+width*6/64*i);
        } else {
          text("+" + researchTracks[i].getBonus(0) + "%⇨+" + researchTracks[i].getBonus(1) + "%", width*440/600, (width*1/12)/2+width*17/120+width*6/64*i);
        }


        imageMode(CORNER);
        textAlign(CENTER, CENTER);
      }

      for (int i = 0; i<7; i++) {
        if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*8/60+width*6/64*i && mouseY < width*8/60+width*1/12+width*6/64*i) {
          displayResearchInfo(i);
        }
      }
    }
  }

  int getResearchChoice() {
    for (int i = 0; i<7; i++) {
      if (mouseX > width/4 && mouseX < width*11/12 && mouseY > width*8/60+width*6/64*i && mouseY < width*8/60+width*1/12+width*6/64*i && gmf.displayResearchMenu == true) {
        if (researchTracks[i].progress >= 4) {
          return -1;
        } else {
          return i;
        }
      }
    }
    return -1;
  }

  void displayResearchInfo(int i) {
    fill(WHITE);
    int[] rectWidths = {width*23/80, width*23/80, width*23/80, width*25/80, width*25/80, width*29/80, width*27/80};
    String[] descriptors = {"Increases Food Gain", "Decreases Build Time", "Decreases Build Cost", "Increases Mineral Gain", "Increases Energy Gain", "Decreases Population Cost", "Increases Research Gain"};
    rect(mouseX+width/60, mouseY, rectWidths[i], width/30);
    fill(BLACK);
    textAlign(LEFT);
    textSize(width*2/75);
    text(descriptors[i], mouseX+width*3/120, mouseY+width/40);
  }
}