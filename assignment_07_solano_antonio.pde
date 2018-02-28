/***************************************************************************************
 artg 2260 - programming basics - northeastern university
 assignment_07 - game - MARS
 antonio solano - solanoroman.j@husky.neu.edu
 
 An evolution of the ATARI Lunar Landing game, except now we try to land a rocket in Mars!
 Featuring:
 - Four classes, plus a master class (called *Mars*)
 - PVectors galore, with wind, gravity and a simple physics system
 - Generative terrain using sine waves and Perlin noise
 - Scores! (while there are no levels, the score is based on using the least amount of fuel)
 - Many event "listeners", triggers and classes that listen to other classes
 **************************************************************************************/

// Game objects
Mars mars;
Terrain terrain;

void setup() {
  //size(800, 600, P2D);
  fullScreen(P2D);
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