class menu {
  String menuType;
  int menuState;

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

        // Options 
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
        text("Options", width*1/2, height*3/5);

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
      stroke(0); 
      line(0, height*1/16, width, height*1/16);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(16);
      text("Pops " + pops, width*4/48, height*2/64);
      text("Minerals " + minerals, width*11/48, height*2/64);
      text("EUs " + energy, width*19/48, height*2/64);
      text("Food " + food, width*25/48, height*2/64);
    }
  }

  void menuClick() {
    if (menuType == "Title") {
      if (menuState == 0) {
        // Play
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*2/5)-40 && mouseY < (height*2/5)+40) {
          state = 1;
        }
        // Options 
        if (mouseX > ((width*1/2)-150) && mouseX < ((width*1/2)+150) && mouseY > (height*3/5)-40 && mouseY < (height*3/5)+40) {
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
    }
  }
}