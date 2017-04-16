class gameManager {
 
  gameManager() {
    
  }
  
  void handleGameState() {
    if (state == 0) {
     titleMenu.displayMenu(); 
    }
  }
  
  void handleMouseClick() {
    if (state == 0) {
      titleMenu.menuClick();
    }
  }
  
  void handleKeyPress() {
    if (state == 0) {
     if (titleMenu.menuState == 2) {
       
     }
    }
  }
  
}