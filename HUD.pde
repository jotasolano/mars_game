class HUD {
  String fontFilename = "8BITWONDERNominal-24.vlw";
  color fontColor = color(#00aa99);
  int score;
  int fuel;
  PFont hudFont;
  float fuelX, fuelY, scoreX, scoreY;
  boolean fuelState = true;

  HUD() {
    fuel = 5000;
    score = 0;
    hudFont = loadFont(fontFilename);

    fuelX = width/10;
    fuelY = height/10;
  }

  void renderFuel() {
    pushStyle();
    println(fuel);
    popStyle();
  }

  void updateFuel(int inc) {
    if (fuel > 0) {
      fuel -= inc;
    } else {
      fuel = 0;
      fuelState = false;
    }
  }
}