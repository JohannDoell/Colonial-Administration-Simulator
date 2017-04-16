int state = 0;

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
gameManager game = new gameManager();

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  game.handleGameState();
}

void mouseClicked() {
  game.handleMouseClick();
}