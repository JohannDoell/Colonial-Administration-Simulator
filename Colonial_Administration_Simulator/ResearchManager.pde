class researchManager {
  boolean isResearching;
  String currentBuildTrack;
  int researchTime, totalResearchTime;
  int farmingProgress, buildTimeProgress, buildCostProgress, miningProgress, powerProgress, popProgress;
  int choice0, choice1, choice2;
  int[] choices = {choice0, choice1, choice2};
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

  void randomizeResearchChoices() {
    choice0 = int(random(1, 7));
    choice1 = int(random(1, 7));
    while (choice1 == choice0) {
      choice2 = int(random(1, 7));
    }
    choice2 = int(random(1, 6));
    while (choice2 == choice1 || choice2 == choice0) {
      choice2 = int(random(1, 6));
    }
    maintainChoices();
  }

  void maintainChoices() {
    choices[0] = choice0;
    choices[1] = choice1;
    choices[2] = choice2;
  }

  void setupBaseResearch () {
    farmingProgress = 0;
    buildTimeProgress = 0;
    buildCostProgress = 0;
    miningProgress = 0;
    powerProgress = 0;
    popProgress = 0;
    randomizeResearchChoices();
  }
}