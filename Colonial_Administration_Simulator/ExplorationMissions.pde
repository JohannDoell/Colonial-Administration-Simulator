class explorationMissions {
  int difficulty, baseFailureChance;
  int resourceChance, buildingChance, relicChance;
  int successChance;
  int missionLength;
  int[] failureChanceArray =   {20, 60, 75, 90, 100};
  int[] resourceChanceArray =  {70, 60, 50, 45, 40};
  int[] buildingChanceArray =  {30, 40, 45, 45, 40};
  int[] relicChanceArray =     {0, 0, 5, 10, 20};
  int[] specialMaxLevelArray = {100, 30, 30, 40};
  int[] missionLengthArray = {10, 20, 30, 40, 50};
  explorationMissions (int i) {
    difficulty = i;
    updateMissionValues();
  }

  void updateMissionValues() {
    baseFailureChance = failureChanceArray[difficulty];
    resourceChance = resourceChanceArray[difficulty];
    buildingChance = buildingChanceArray[difficulty];
    relicChance = relicChanceArray[difficulty];
    missionLength = missionLengthArray[difficulty];
    successChance = 100 + ships[selectedShip].failureReduction - baseFailureChance;
    if (successChance >= 100) {
      successChance = 100;
    }

    if (ships[selectedShip].shipLevel == 5) {
      baseFailureChance = specialMaxLevelArray[0];
      resourceChance = specialMaxLevelArray[1];
      buildingChance = specialMaxLevelArray[2];
      relicChance = specialMaxLevelArray[3];
    }
  }

  void displayMission() {
    if (selectedMission == difficulty && ships[selectedShip].isBought == true) {
      textSize(width*2/75);
      textAlign(LEFT, CENTER);
      text("Success Chance: " + successChance + "%", 160, 120);
      text("On Success:", 160, 145);
      text("   Resource Cache: " + resourceChance + "%", 160, 170);
      text("   Reclaimed Building: " + buildingChance + "%", 160, 195);
      if (relics > 0) {
        text("   Alien Relic: " + relicChance + "%", 160, 220);
      } else {
        text("   ???: " + relicChance + "%", 160, 220);
      }
      text("Mission Length: " + missionLength + " Turns", 160, 245);
    }
  }
}