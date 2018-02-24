class Mars {
  int fuelDecay = 1;
  boolean fuel = true;
  float inc = 0.02;  
  PVector pos = new PVector(width/4, 30);

  // Mars objects
  Booster booster;
  Terrain terrain;
  HUD hud;

  // Main constructor
  Mars() {
    terrain = new Terrain(inc);
    hud = new HUD();

    booster = new Booster(pos);
  }

  // setting the vertices for terrain only once
  void setMars() {
    terrain.createTerrain();
    terrain.createStars();
  }

  // Running
  void run() {
    // Physics
    booster.update();
    booster.render();


    // Draw
    terrain.renderStars();
    terrain.renderMountains();
    terrain.renderPlatform();
    hud.renderFuel();
    hud.renderTime();
    terrain.checkCollision(booster);
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