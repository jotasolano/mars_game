class Terrain {

  float inc;
  float start;
  float xoff;
  float x, y;
  float[] terrX = new float[width];
  float[] terrY = new float[width];

  Terrain(float inc) {
    this.inc = inc;
  }

  void createTerrain() {
    for (int x = 0; x < width; x++) {
      float n = map(noise(xoff), 0, 1, -60, 60);
      float s = map(sin(xoff), -1, 1, height, height/2);
      float y = s + n;

      terrX[x] = x;
      terrY[x] = y;
      xoff += inc;
    }
    start += inc;
  }

  void render() {
    pushMatrix();
    pushStyle();
    beginShape();
    for (int i = 0; i < terrX.length; i++) {
      stroke(0);
      noFill();
      if (terrX[i] > 5*width/8 && terrX[i] < 6*width/8) {
        vertex(terrX[i], 550);
      }
      else {vertex(terrX[i], terrY[i]); };
    }
    endShape();
    popStyle();
    popMatrix();
  }
}