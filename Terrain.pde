class Terrain {

  float inc;
  float start;
  float xoff;
  float x, y;
  float[] terrX = new float[width];
  float[] terrY = new float[width];
  float[] starsX = new float[150];
  float[] starsY = new float[150];
  float platformHeight = height -100;

  float[] p1 = {8*width/12, 9*width/12};

  Terrain(float inc) {
    this.inc = inc;
  }

  void createTerrain() {
    for (int x = 0; x < width; x++) {
      float h = map(x, 0, width, 3, 1);
      float n = map(noise(xoff), 0, 1, -60, 60);
      float s = map(sin(xoff), -h, h, height-20, height/2);
      float y = s + n;
      terrX[x] = x;
      terrY[x] = y;
      xoff += inc;
    }
    start += inc;
  }

  void createStars() {
    for (int i = 0; i < starsX.length; i++) {
      float x = random(0, width);
      float y = random(0, 3*height/4);
      starsX[i] = x;
      starsY[i] = y;
    }
  }

  void renderMountains() {
    pushMatrix();
    pushStyle();
    beginShape();
    noStroke();
    fill(178, 70, 34);
    vertex(0, height);
    for (int i = 0; i < terrX.length; i++) {
      if (terrX[i] > p1[0] && terrX[i] < p1[1]) {
        vertex(terrX[i], platformHeight);
      } else {
        vertex(terrX[i], terrY[i]);
      };
    }
    vertex(width, height);
    endShape();
    popStyle();
    popMatrix();
  }

  void renderPlatform() {
    pushMatrix();
    pushStyle();
    fill(100);
    noStroke();
    rect(p1[0], platformHeight, p1[1] - p1[0], 10);

    // yellow strokes
    stroke(255, 213, 0);
    strokeWeight(3);
    strokeCap(SQUARE);
    translate(p1[0], 0);
    for (int i = 0; i < p1[1] - p1[0]; i++) {
      if (i % 9 == 0) {
        line(i, platformHeight, i, platformHeight + 10);
      }
    }
    popStyle();
    popMatrix();
  }

  void renderStars() {
    pushMatrix();
    pushStyle();
    noStroke();
    for (int i = 0; i < starsX.length; i++) {
      fill(map(starsY[i], 0, 3*height/4, 255, 50), random(100, 255));
      ellipse(starsX[i], starsY[i], 3, 3);
    }
    popStyle();
    popMatrix();
  }

  boolean checkCollision(Booster b, Splash splash, HUD hud) {
    boolean collided = false;
    boolean win;
    if (terrY[(int)b.position.x] < b.position.y+10) {
      collided = true;
      win = false;
      b.velocity.setMag(0);
      b.thrust.setMag(0.000001);
      b.renderCrash();
      splash.ending(win, hud);
    }
    return collided;
  }

  boolean checkLanding(Booster b, Splash splash, HUD hud) {
    boolean landed = false;
    boolean win = false;
    if (b.position.x>= 8*width/12 && b.position.x <= 9*width/12 && b.position.y+31 >= platformHeight) {
      win = true;
      b.velocity.setMag(0);
      b.thrust.setMag(0.000001);
      splash.ending(win, hud);
    }
    return landed;
  }
}