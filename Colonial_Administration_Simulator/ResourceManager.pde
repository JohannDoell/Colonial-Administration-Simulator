class resourceManager {
  resourceManager() {
    pops = 1;
    food = 10;
    minerals = 100;
    energy = 100;
  }
  
  void updateResources() {
    pops = pops + popIncrease;
    popIncrease = 0;
    
    food = food + foodIncrease;
    minerals = minerals + mineralIncrease;
    energy = energy + energyIncrease;
  }
  
}