/***************************************************************************************
 artg 2260 - programming basics - northeastern university
 assignment_07 - game - MARS
 antonio solano - solanoroman.j@husky.neu.edu
 **************************************************************************************/

// Game objects
Mars mars;
Terrain terrain;

void setup() {
  size(800, 600, P2D);
  //fullScreen(P2D);
  background(0);
  pixelDensity(displayDensity());

  mars = new Mars();
  mars.setMars();
}

void draw() {
    mars.run();
 
  if (keyPressed) {
    if (key == CODED) {
      switch(keyCode) {
      case UP:
        mars.pressedUp();
        break;
      case DOWN:
        mars.pressedDown();
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