class gameManager {

  gameManager() {
  }

  void handleGameState() {
    if (state == 0) {
      titleMenu.displayMenu();
    } else if (state == 1) {
      gmf.displayMenu();
      researchMenu.displayMenu();
      constructionMenu.displayMenu();
    }
  }

  void handleMouseClick() {
    if (state == 0) {
      titleMenu.menuClick();
    } else if (state == 1) {
      gmf.menuClick();
    }
  }

  void handleKeyPress() {
    if (state == 1) {
    }
  }
}