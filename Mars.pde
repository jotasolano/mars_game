class Mars {
  float inc = 0.02;  
  PVector pos = new PVector(60, 70);

  // Mars objects
  Booster booster;
  Terrain terrain;
  HUD hud;
  Splash splash;

  // Main constructor
  Mars() {
    terrain = new Terrain(inc);
    hud = new HUD();
    splash = new Splash();

    booster = new Booster(pos, 0);
  }

  // setting the vertices for terrain only once
  void setMars() {
    terrain.createTerrain();
    terrain.createStars();
    splash.render();
  }

  // Running
  void run() {
    splash.clickedSplash();
    // Check if we're on splash screen, then execute everything
    if (splash.splashClicked == true) {
      background(10, 6);  
      terrain.renderStars();
      booster.update();
      booster.render();
      booster.visualizeForces();

      terrain.renderMountains();
      terrain.renderPlatform();
      terrain.checkCollision(booster);
      hud.updateFuel(booster.engineRunning);

      // Kill thrust if we run out of fuel
      if (hud.fuel == 0) {
        booster.thrust.setMag(0.00000001);
        println("out of thrust");
      }

      hud.renderFuel();
      hud.renderTime();
    }
  }

  // Key functions
  void pressedUp() {
    if (hud.fuelState == true) {
      booster.thrust(0.001);
    }
  }

  void pressedDown() {
    if (hud.fuelState == true) {
      booster.thrust(-0.001);
    }
  }

  void pressedLeft() {
    if (hud.fuelState == true) {
      booster.turn(-0.02);
      hud.updateFuel(booster.engineRunning);
    }
  }

  void pressedRight() {
    if (hud.fuelState == true) {
      booster.turn(0.02);
      hud.updateFuel(booster.engineRunning);
    }
  }
}