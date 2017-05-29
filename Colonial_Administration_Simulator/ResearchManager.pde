class researchManager {
  boolean isResearching;
  String currentBuildTrack;
  int researchTime, totalResearchTime;
  int farmingProgress, buildTimeProgress, buildCostProgress, miningProgress, powerProgress, popProgress;
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
      println(researchChoice);
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
}