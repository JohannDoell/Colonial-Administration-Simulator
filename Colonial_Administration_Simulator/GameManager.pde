class gameManager {

  gameManager() {
  }

  void handleGameState() {
    background(255);
    // Title Screen
    if (state == 0) {
      titleMenu.displayMenu();
    } 
    // Game
    else if (state == 1) {
      if (gmf.displayResearchMenu == true) {
        researchMenu.displayMenu();
      }
      if (gmf.displayConstructionMenu == true) {   
        constructionMenu.displayMenu();
      }
      if (gmf.displayExplorationMenu == true) {
        explorationMenu.displayMenu();
      }
      gmf.displayMenu();
      resoMan.updateResourceIncreases();
    } 
    else if (state == 2) {
      gmf.loseScreen();
    } else if (state == 3) {
      gmf.winScreen();
    }
  }

  void handleMouseClick() {
    if (state == 0) {
      titleMenu.menuClick();
    } else if (state == 1) {
      gmf.menuClick();
      if (gmf.displayConstructionMenu == true) {
        constructionMenu.menuClick();
      } else if (gmf.displayResearchMenu == true) {
        researchMenu.menuClick();
      } else if (gmf.displayExplorationMenu == true) {
        explorationMenu.menuClick();
      }
    }
  }

  void handleKeyPress() {
    if (state == 1) {
      gmf.menuPress();
    }
  }
}