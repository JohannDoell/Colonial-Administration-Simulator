int state, turn;
// Resource related variables
int pops, food, minerals, energy, research;
int popIncrease, foodIncrease, mineralIncrease, energyIncrease;
int foodTax, mineralTax, energyTax;
int foodMax, mineralMax, energyMax;
// Currently unused.
String nationName, playerName;
// Standardized colours.
color WHITE, GREY, LIGHTGREY, BLACK, GREEN, DARKGREEN, RED;
// Grid variables.
int tilesWide = 5;
int tilesHigh = 3;
// Grid selection variables.
int selectedGridX, selectedGridY;
// Confirmation gates for construction actions.
boolean demolishGate = false;
boolean buildGate = false;
boolean upgradeGate = false;
// Resource images.
PImage pPop, pFood, pMineral, pEnergy, pResearch;

// Construction menu grid.
tiles[][] buildingGrid = new tiles[tilesWide][tilesHigh];

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
menu gmf = new menu("Game Menu Frame");
gameManager game = new gameManager();
turnManager turMan = new turnManager();
researchManager resMan = new researchManager();

void setup() {
  size(600, 600);
  state = 0;
  WHITE = color(255);
  GREY = color(155);
  LIGHTGREY = color(200);
  BLACK = color(0);
  GREEN = color(#23E831);
  DARKGREEN = color(#178E1F);
  RED = color(#CE1717);

  pPop = loadImage("pop.jpg");
  pFood = loadImage("apple.jpg");
  pMineral = loadImage("cog.jpg");
  pEnergy = loadImage("lightning.jpg");
  pResearch = loadImage("testtubes.jpg");

  for (int i=0; i<tilesWide; i++) {
    for (int j=0; j<tilesHigh; j++) {
      buildingGrid[i][j] = new tiles(i, j);
    }
  }
}

void draw() {
  game.handleGameState();
}

void mouseClicked() {
  game.handleMouseClick();
}

void keyPressed() {
  game.handleKeyPress();
}