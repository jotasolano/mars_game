class Mars {
  int fuelDecay = 1;
  boolean fuel = true;

  float theta;
  PVector xaxis = new PVector(1, 0);
  float inc = 0.02;

  PVector gravity = new PVector(0, 0.05);

  // Mars objects
  Rocket rocket;
  Booster booster;
  Terrain terrain;
  HUD hud;

  // Main constructor
  Mars() {
    terrain = new Terrain(inc);
    hud = new HUD();

    booster = new Booster();
  }

  // setting the vertices for terrain only once
  void setMars() {
    //terrain.createTerrain();
    //terrain.createStars();
  }

  // Running
  void run() {
    // Physics
    booster.update();
    booster.render();


    //rocket.gravity();
    // Draw
    //terrain.renderStars();
    //terrain.renderMountains();
    //terrain.renderPlatform();
    hud.renderFuel();
    hud.renderTime();
  }

  // Key functions
  void pressedUp() {
    if (hud.fuelState == true) {
      booster.thrust();
      hud.updateFuel(fuelDecay);
    }
  }
  
  void pressedDown() {
    if (hud.fuelState == true) {
      booster.reduceThrust();
      hud.updateFuel(fuelDecay);
    }
  }
  
  void pressedLeft() {
    if (hud.fuelState == true) {
      booster.moveLeft();
      hud.updateFuel(fuelDecay);
    }
  }
  
  void pressedRight() {
    if (hud.fuelState == true) {
      booster.moveRight();
      hud.updateFuel(fuelDecay);
    }
  }
}