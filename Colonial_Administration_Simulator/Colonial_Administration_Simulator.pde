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
int pops, food, minerals, energy, research, relics;
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
// Exploration selection variable.
int selectedShip, selectedMission;
// Confirmation gates for construction actions.s
boolean demolishGate, buildGate, upgradeGate, deployGate, repairGate, shipUpgradeGate;
// Resource images.
PImage pPop, pFood, pMineral, pEnergy, pResearch, pNil, pX, pClock, pHammer, pLevel, pHealth;
// Save Game.
JSONObject saveGame, baseGame;
// Display Notification Booleans
boolean displayShipEventNotification, displayRandomEventNotification, notificationDisplayed;
// Random Event Variables
int eventNumber;
boolean freeBuilding;

// Construction menu grid.
tiles[][] buildingGrid = new tiles[tilesWide][tilesHigh];

researchObjects[] researchTracks = new researchObjects[7];
gameSaves[] saveGames = new gameSaves[3];
explorationMissions[] missions = new explorationMissions[5];

// Ships
explorationShips[] ships = new explorationShips[3];

menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");
menu explorationMenu = new menu("Exploration");
menu gmf = new menu("Game Menu Frame");
menu notification = new menu("Notification");
gameManager game = new gameManager();
turnManager turMan = new turnManager();
researchManager reseMan = new researchManager();
gameFileManager gameFileMan = new gameFileManager();
resourceManager resoMan = new resourceManager();
randomEventManager randMan = new randomEventManager();
notificationManager notManager = new notificationManager();

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

  pPop = loadImage("Images/pop.png");
  pFood = loadImage("Images/apple.png");
  pMineral = loadImage("Images/cog.png");
  pEnergy = loadImage("Images/lightning.png");
  pResearch = loadImage("Images/testtubes.png");
  pNil = loadImage("Images/empty.png");
  pX = loadImage("Images/x.png");
  pClock = loadImage("Images/clock.png");
  pHammer = loadImage("Images/hammer.png");
  pLevel = loadImage("Images/arrow.png");
  pHealth = loadImage("Images/wrench.png");

  for (int i=0; i<tilesWide; i++) {
    for (int j=0; j<tilesHigh; j++) {
      buildingGrid[i][j] = new tiles(i, j);
    }
  }
  for (int i=0; i<researchTracks.length; i++) {
    researchTracks[i] = new researchObjects(i);
  }
  for (int i=0; i<3; i++) {
    saveGames[i] = new gameSaves(i);
  }
  for (int i=0; i<ships.length; i++) {
    ships[i] = new explorationShips(i);
  }
  for (int i=0; i<missions.length; i++) {
    missions[i] = new explorationMissions(i);
  }

  saveGame = new JSONObject();
  selectedShip = 0;
  relics = 0;
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
  if (key == 'y') {
    ships[selectedShip].experience = ships[selectedShip].experience + 20;
  }
  if (key == 'r') {
    relics++;
  }
}