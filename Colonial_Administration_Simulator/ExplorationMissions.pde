class explorationMissions {
  int difficulty, baseFailureChance;
  int resourceChance, buildingChance, relicChance;
  int successChance;
  int missionLength;
  int[] failureChanceArray =   {20, 60, 75, 90, 100};
  int[] relicChanceArray =     {1, 5, 10, 20, 50};
  int[] specialMaxLevelArray = {5, 10, 20, 40, 80};
  int[] missionLengthArray = {10, 20, 30, 40, 50};
  explorationMissions (int i) {
    difficulty = i;
    updateMissionValues();
  }

  void updateMissionValues() {
    // Calculate success chances from difficulty.
    baseFailureChance = failureChanceArray[difficulty];
    relicChance = relicChanceArray[difficulty];
    missionLength = missionLengthArray[difficulty];
    successChance = 100 + ships[selectedShip].failureReduction - baseFailureChance;
    if (successChance >= 100) {
      successChance = 100;
    }
    // Level Five Ships are special.
    if (ships[selectedShip].shipLevel == 5) {
      relicChance = specialMaxLevelArray[difficulty];
    }
  }

  void displayMission() {
    // Display Information when selected on the exploration screen.
    if (selectedMission == difficulty && ships[selectedShip].isBought == true) {
      textSize(width*2/75);
      textAlign(LEFT, CENTER);
      text("Success Chance: " + successChance + "%", 160, 120);
      text("On Success:", 160, 145);
      if (relics > 0) {
        text("   Alien Relic: " + relicChance + "%", 160, 170);
      } else {
        text("   ???: " + relicChance + "%", 160, 170);
      }
      text("Mission Length: " + missionLength + " Turns", 160, 245);
    }
  }
}