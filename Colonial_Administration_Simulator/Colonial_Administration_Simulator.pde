int state;
int turn;
int pops, food, minerals, energy;
int popIncrease, foodIncrease, mineralIncrease, energyIncrease;
String nationName, playerName;
color WHITE, GREY, BLACK;

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
menu gmf = new menu("Game Menu Frame");
gameManager game = new gameManager();
turnManager turMan = new turnManager();

void setup() {
  size(600, 600);
  state = 0;
  WHITE = color(255);
  GREY = color(155);
  BLACK = color(0);
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