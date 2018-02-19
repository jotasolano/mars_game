/***************************************************************************************
 artg 2260 - programming basics - northeastern university
 assignment_07 - game - MARS
 antonio solano - solanoroman.j@husky.neu.edu
 **************************************************************************************/

// Global vars


// Game objects
Mars mars;
Terrain terrain;

void setup() {
  size(800, 600);
  background(200);
  pixelDensity(displayDensity());

  mars = new Mars();
  terrain = new Terrain(0.03);
  
  stroke(0);
  mars.setMars();
}

void draw() {
  background(200);
  mars.run();

  if (keyPressed) {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        mars.pressedUp();
        break;
      case LEFT:
        mars.pressedLeft();
        break;
      case RIGHT:
        mars.pressedRight();
        break;
      }
    }
  }
}