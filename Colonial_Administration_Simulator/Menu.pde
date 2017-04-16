class menu {
  String menuType;
  
  menu(String _menuType) {
    menuType = _menuType;
  }
  
  void displayMenu() {
    if (menuType == "Title") {
      fill(0);
      rectMode(CENTER);
      rect(width/2, height/5, 400, 100);
      fill(255);
      textMode(CENTER);
      textAlign(CENTER, CENTER);
      textSize(23);
      text("Colonial Administration Simulator", width/2, height/5);
    } else if (menuType == "Research") {
    } else if (menuType == "Construction") {
    }
  }
}