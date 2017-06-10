class explorationMissions {
  int difficulty, failureChance, rewardChance;
  int resourceChance, buildingChance, relicChance;
  int[] failureChanceArray = {20, 60, 75, 80, 90, 100};
  int[] resourceChanceArray = {50, 50, 50, 50, 50, 50};
  int[] buildingChanceArray = {5, 10, 25, 30, 50, 70};
  int[] relicChanceArray = {0, 0, 5, 10, 20, 30};
  explorationMissions () {
  }

  void updateMissionValues(int i) {
    difficulty = i;
    failureChance = failureChanceArray[i];
    resourceChance = resourceChanceArray[i];
  }

  void displayMission() {
  }
}