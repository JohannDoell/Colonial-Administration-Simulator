class explorationManager {
  int resourceChance, buildingChance, relicChance;
  int successChance, missionLength;
  int damageToShip;
  explorationManager () {
  }

  void prepMissionStats() {
    successChance = missions[selectedMission].successChance;
    resourceChance = missions[selectedMission].resourceChance;
    buildingChance = missions[selectedMission].buildingChance;
    relicChance = missions[selectedMission].relicChance;
    missionLength = missions[selectedMission].missionLength;
  }
}