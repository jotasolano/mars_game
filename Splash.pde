class Splash {
  PFont h1, h2;
  String fontURL = "VT323-Regular.ttf";
  boolean splashClicked;
  color orange = #f15a29;
  String instructions = "Use the arrows to navigate and try to land \n the Mars booster in the platform";
  boolean win = false;

  Splash() {
    splashClicked = false;
    h1 = createFont(fontURL, 42, true);
    h2 = createFont(fontURL, 26, true);
  }

  void render() {
    pushMatrix();
    pushStyle();
    fill(200);
    noStroke();
    rectMode(CENTER);
    rect(width/2, height/2, 800, 500);

    textAlign(CENTER);
    fill(orange);
    textFont(h1);
    text("Mars landing", width/2, height/2 - 150);

    textFont(h2);
    text(instructions, width/2, height/2 - 100);
    text("Click anywhere to start! \n ", width/2, height/2 + 100);
    popStyle();
    popMatrix();
  }

  void ending(boolean win, HUD hud) {
    pushMatrix();
    pushStyle();
    textAlign(CENTER);
    fill(orange);
    if (win == true) {
      textFont(h1);
      text("You have won!", width/2, height/2 - 150);
      textFont(h2);
      text("Total points: " + hud.fuel*10, width/2, height/2 - 100);
    } else if (win == false) {
      textFont(h1);
      text("You have lost!", width/2, height/2 - 150);
      textFont(h2);
      text("and everybody's dead", width/2, height/2 - 100);
    }
    popStyle();
    popMatrix();
  }

  boolean clickedSplash() {
    if (mousePressed == true) {
      splashClicked = true;
    }
    return splashClicked;
  }
}