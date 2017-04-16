menu titleMenu = new menu("Title");
menu researchMenu = new menu("Research");
menu constructionMenu = new menu("Construction");

void setup() {
  size(600,600);
}

void draw() {
  background(255);
  titleMenu.displayMenu();
}