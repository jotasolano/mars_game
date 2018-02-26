class Splash {
  PFont h1, h2;
  String fontURL = "VT323-Regular.ttf";
  boolean splashClicked;
  color orange = #f15a29;
  String instructions = "Use the arrows to navigate and try to land \n the Mars booster in the platform";

  Splash() {
    splashClicked = false;
    h1 = createFont(fontURL, 42, true);
    h2 = createFont(fontURL, 26, true);
  }

  void render() {
    pushMatrix();
    pushStyle();
    fill(200);
    rect(40, 40, width-80, height-80);

    textAlign(CENTER);
    fill(orange);
    textFont(h1);
    text("Mars landing", width/2, 200);

    textFont(h2);
    text(instructions, width/2, 300);
    text("Click anywhere to start! \n ", width/2, 500);
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