int state;
int turn;
int pops, food, minerals, energy, research;
int popIncrease, foodIncrease, mineralIncrease, energyIncrease;
String nationName, playerName;
color WHITE, GREY, BLACK;

int tilesWide = 5;
int tilesHigh = 3;

tiles[][] buildingGrid = new tiles[tilesWide][tilesHigh];

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
  
  for (int i=0;i<tilesWide;i++) {
   for (int j=0;j<tilesHigh;j++) {
     buildingGrid[i][j] = new tiles(i,j);
   }
  }
  
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