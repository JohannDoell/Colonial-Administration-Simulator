class menu {
  String menuType;
  int menuState;
  boolean displayInGameMenu = false;
  String[] igmOptions = {};


  menu(String _menuType) {
    menuType = _menuType;
  }

  void displayMenu() {
    if (menuType == "Title") {
      if (menuState == 0) {
        stroke(0);
        // Title
        fill(0);
        rectMode(CENTER);
        rect(width*1/2, height*1/5, width*4/6, height*1/6);
        fill(255);
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Colonial Administration Simulator", width*1/2, height*1/5);

        // Play
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          fill(255);
        } else {
          fill(0);
        }
        rectMode(CENTER);
        rect(width*1/2, height*2/5, 300, 80);
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          fill(0);
        } else {
          fill(255);
        }
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Play", width*1/2, height*2/5);

        // Load 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
          fill(255);
        } else {
          fill(0);
        }
        rectMode(CENTER);
        rect(width*1/2, height*3/5, 300, 80);
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
          fill(0);
        } else {
          fill(255);
        }
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Load", width*1/2, height*3/5);

        // Options 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*4/5)-40 && mouseY < (height*4/5)+40) {
          fill(255);
        } else {
          fill(0);
        }
        rectMode(CENTER);
        rect(width*1/2, height*4/5, 300, 80);
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*4/5)-40 && mouseY < (height*4/5)+40) {
          fill(0);
        } else {
          fill(255);
        }
        textAlign(CENTER, CENTER);
        textSize(23);
        text("Options", width*1/2, height*4/5);


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-15) && mouseX < ((width*95/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          fill(0);
        } else {
          fill(255);
        }
        rect(width*95/100, height*5/100, 30, 30);
        stroke(#FF0505);
        line((width*95/100)-10, (height*5/100)-10, (width*95/100)+10, (height*5/100)+10);
        line((width*95/100)+10, (height*5/100)-10, (width*95/100)-10, (height*5/100)+10);
      } else if (menuState == 1) {
        // Back Button
        stroke(0);
        rectMode(CENTER);
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          fill(0);
        } else {
          fill(255);
        }
        rect(width*5/100, height*5/100, 30, 30);
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          stroke(255);
        } else {
          stroke(0);
        }
        line((width*5/100)-5, height*5/100, (width*5/100)+10, height*5/100);
        triangle((width*5/100)-5, (height*5/100)-5, (width*5/100)-10, (height*5/100), (width*5/100)-5, (height*5/100)+5);
      }
    } else if (menuType == "Research") {
    } else if (menuType == "Construction") {
    } else if (menuType == "Game Menu Frame") {
      // Resource Menus
      stroke(0); 
      line(0, height*1/16, width, height*1/16);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(16);
      text("Pops " + pops + "+" + popIncrease, width*4/48, height*4/128);
      text("Minerals " + minerals + "+" + mineralIncrease, width*13/48, height*4/128);
      text("EUs " + energy + "+" + energyIncrease, width*23/48, height*4/128);
      text("Food " + food + "+" + foodIncrease, width*31/48, height*4/128);

      // InGame Option Menu
      stroke(0); 
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(16);
      if (mouseX > (width)-(width*1/16) && mouseX < (width) && mouseY > 0 && mouseY < (height*1/16) || displayInGameMenu == true) {
        fill(155);
      } else {
        fill(0);
      }
      rect((width)-((width*1/16)/2), (height*1/16)/2, width*1/16, height*1/16);

      if (displayInGameMenu == true) {
        // Options
        stroke(0); 
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)-height*1/16  && mouseY < (height*1/8) ) {
          fill(0);
        } else {
          fill(155);
        }
        rect((width)-((width*1/8)/2), (height*1/8)-height*1/32, width*1/4, height*1/16);
        fill(255);
        text("Options", (width)-((width*1/8)/2), (height*1/8)-height*1/32);
        // Save
        stroke(0); 
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)  && mouseY < (height*1/8)+height*1/16 ) {
          fill(0);
        } else {
          fill(155);
        }
        rect((width)-((width*1/8)/2), (height*1/8)+height*1/32, width*1/4, height*1/16);
        fill(255);
        text("Save", (width)-((width*1/8)/2), (height*1/8)+height*1/32);
        // Quit
        stroke(0); 
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(16);
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)+height*1/16 && mouseY < (height*1/8)+height*1/8 ) {
          fill(0);
        } else {
          fill(155);
        }
        rect((width)-((width*1/8)/2), (height*1/8)+height*3/32, width*1/4, height*1/16);
        fill(255);
        text("Quit", (width)-((width*1/8)/2), (height*1/8)+height*3/32);
      }
    }
  }

  void menuClick() {
    if (menuType == "Title") {
      if (menuState == 0) {
        // Play
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          state = 1;
        }
        // Load 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
          // Load Functionality
        }
        // Options
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*4/5)-40 && mouseY < (height*4/5)+40) {
          menuState = 1;
        }


        // Exit
        rectMode(CENTER);
        if (mouseX > ((width*95/100)-15) && mouseX < ((width*95/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          exit();
        }
      } else if (menuState == 1) {
        // Back Button
        if (mouseX > ((width*5/100)-15) && mouseX < ((width*5/100)+15) && mouseY > (height*5/100)-15 && mouseY < (height*5/100)+15) {
          menuState = 0;
        }
      }
    } else if (menuType == "Research") {
    } else if (menuType == "Construction") {
    } else if (menuType == "Game Menu Frame") {
      if (mouseX > (width)-(height*1/16) && mouseX < (width) && mouseY > 0 && mouseY < (height*1/16)) {
        displayInGameMenu = !displayInGameMenu;
      }

      if (displayInGameMenu == true) {
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)+height*1/16 && mouseY < (height*1/8)+height*1/8 ) {
          state = 0;
          displayInGameMenu = false;
        }
        if (mouseX > (width)-(width*1/4) && mouseX < width && mouseY > (height*1/8)-height*1/16  && mouseY < (height*1/8) ) {
          state = 0;
          titleMenu.menuState = 1;
        }
      }
    }
  }
}