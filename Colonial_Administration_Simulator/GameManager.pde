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
      //notification.displayMenu();
    } 
    // Loss Screen
    else if (state == 2) {
      gmf.loseScreen();
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

  void handleMouseDrag() {
    if (state == 0) {
    } else if (state == 1) {
    }
  }

  void handleKeyPress() {
    if (state == 1) {
      gmf.menuPress();
    }
  }
}