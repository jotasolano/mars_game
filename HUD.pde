class HUD {
  String fontURL = "VT323-Regular.ttf";
  color fontColor = color(#00aa99);
  PFont h1, h3;
  float fuelX, fuelY, timeX, timeY;

  int fuel, mins, secs;
  int m;

  boolean fuelState = true;

  HUD() {
    fuel = 200;
    h1 = createFont(fontURL, 24, true);
    h3 = createFont(fontURL, 22, true);

    fuelX = width/10;
    fuelY = height/10;

    timeX = 3*width/10;
    timeY = height/10;
  }

  void renderFuel() {
    pushMatrix();
    pushStyle();
    textFont(h1);
    textAlign(LEFT);
    fill(fontColor);
    text("Fuel left", fuelX, fuelY - 20);
    textFont(h3);
    text(fuel, fuelX, fuelY);
    popStyle();
    popMatrix();
  }

  void renderTime() {
    m = millis();
    pushStyle();
    textFont(h1);
    textAlign(LEFT);
    fill(fontColor);
    text("Time", timeX, timeY - 20);
    textFont(h3);
    text(m/1000 + " secs", timeX, timeY);
    popStyle();
  }
  
  void updateFuel(boolean engineRunning) {
    if (fuel > 0) {
      if (engineRunning == true) {
        fuel -= 1;
      }
    } else {
      fuel = 0;
      fuelState = false;
    }
  }
}