int state;
int pops, food, minerals, energy;
String nationName, playerName;

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
menu gmf = new menu("Game Menu Frame");
gameManager game = new gameManager();
resourceManager resMan = new resourceManager();

void setup() {
  size(600, 600);
  state = 0;

}

void draw() {
  background(255);
  game.handleGameState();
}

void mouseClicked() {
  game.handleMouseClick();
}

void keyPressed() {
 game.handleKeyPress(); 
}