// ---------------------------------------------------------------------------------------------- //
// Colonial Administration Simulator by Johann Doell
// ---------------------------------------------------------------------------------------------- //
// A Stellaris empire building Clone.
// There are multiple classes that interact with one another and contribute to the greater system.
// No object or object in an array is ever "destroyed" but the system is designed for them to change constantly.
// Each object in the main array indirectly interacts with the other objects in the array through resource values.
//----------------------------------------------------------------------------------------------- //

int state, turn;
// Resource related variables
int pops, food, minerals, energy, research;
int foodIncrease, mineralIncrease, energyIncrease, researchIncrease;
float popResearchBonus, foodResearchBonus, buildTimeResearchBonus, buildCostResearchBonus, mineralResearchBonus, energyResearchBonus;
int foodTax, mineralTax, energyTax;
int foodMax, mineralMax, energyMax;
int foodNeededForPop = 100;
// Currently unused.
String nationName, playerName;
// Standardized colours.
color WHITE, DARKGREY, GREY, LIGHTGREY, BLACK, GREEN, DARKGREEN, RED;
// Grid variables.
int tilesWide = 7;
int tilesHigh = 4;
// Grid selection variables.
int selectedGridX, selectedGridY;
// Confirmation gates for construction actions.
boolean demolishGate, buildGate, upgradeGate;
// Resource images.
PImage pPop, pFood, pMineral, pEnergy, pResearch, pNil, pX, pClock, pHammer, pLevel;
// Save Game.
JSONObject saveGame, baseGame;

// Construction menu grid.
tiles[][] buildingGrid = new tiles[tilesWide][tilesHigh];
// Research Track
researchObjects[] researchTracks = new researchObjects[7];
gameSaves[] saveGames = new gameSaves[3];

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
menu gmf = new menu("Game Menu Frame");
gameManager game = new gameManager();
turnManager turMan = new turnManager();
researchManager reseMan = new researchManager();
gameFileManager gameFileMan = new gameFileManager();
resourceManager resoMan = new resourceManager();
randomEventManager randMan = new randomEventManager();

void setup() {
  size(600, 600);
  state = 0;
  WHITE = color(255);
  GREY = color(155);
  LIGHTGREY = color(200);
  DARKGREY = color(100);
  BLACK = color(0);
  GREEN = color(#23E831);
  DARKGREEN = color(#178E1F);
  RED = color(#CE1717);

  pPop = loadImage("pop.png");
  pFood = loadImage("apple.png");
  pMineral = loadImage("cog.png");
  pEnergy = loadImage("lightning.png");
  pResearch = loadImage("testtubes.png");
  pNil = loadImage("empty.png");
  pX = loadImage("x.png");
  pClock = loadImage("clock.png");
  pHammer = loadImage("hammer.png");
  pLevel = loadImage("arrow.png");

  for (int i=0; i<tilesWide; i++) {
    for (int j=0; j<tilesHigh; j++) {
      buildingGrid[i][j] = new tiles(i, j);
    }
  }

  for (int i=0; i<7; i++) {
    researchTracks[i] = new researchObjects(i);
  }

  for (int i=0; i<3; i++) {
    saveGames[i] = new gameSaves(i);
  }

  saveGame = new JSONObject();
}

void draw() {
  game.handleGameState();
  println(mouseX, mouseY);
}

void mouseClicked() {
  game.handleMouseClick();
}

void mouseDragged() {
  game.handleMouseDrag();
}

void keyPressed() {
  game.handleKeyPress();
}