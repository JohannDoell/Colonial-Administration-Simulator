class researchManager {
  boolean isResearching;
  String currentBuildTrack;
  int researchTime, totalResearchTime;
  int farmingProgress, buildTimeProgress, buildCostProgress, miningProgress, powerProgress, popProgress, researchProgress;
  int selection;
  researchManager() {
    isResearching = false;
    researchTime = 0;
    totalResearchTime = 0;
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
}