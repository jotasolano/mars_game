class Mars {

  float rocketW = 15;
  float rocketH = 60;
  float rocketVx = 0.05;
  float rocketVy = 0.05;
  float gravity = 0.0001;
  float acceleration = 0.01;
  float angle = 0;
  float angleVar = PI / 100;

  int fuelDecay = 1;
  boolean fuel = true;

  float inc = 0.02;


  // Mars objects
  Rocket rocket;
  Terrain terrain;
  HUD hud;

  // Main constructor
  Mars() {
    rocket = new Rocket(30, 40, rocketW, rocketH, gravity, angle, angleVar,
    acceleration, acceleration);

    terrain = new Terrain(inc);
    hud = new HUD();
  }

  // setting the vertices for terrain only once
  void setMars() {
    terrain.createTerrain();
    terrain.createStars();
  }

  // Running
  void run() {
    // Physics
    rocket.fall();

    // Draw
    terrain.renderStars();
    rocket.render();
    terrain.renderMountains();
    terrain.renderPlatform();
    hud.renderFuel();
    hud.renderTime();
    terrain.checkCollision(rocket);
    
    //rocket.checkLanding();
  }

  // Key functions
  void pressedUp() {
    if (hud.fuelState == true) {
      rocket.moveUp(fuel);
      hud.updateFuel(fuelDecay);
    }
  }
  void pressedLeft() {
    if (hud.fuelState == true) {
      rocket.moveLeft();
      hud.updateFuel(fuelDecay);
    }
  }
  void pressedRight() {
    if (hud.fuelState == true) {
      rocket.moveRight();
      hud.updateFuel(fuelDecay);
    }
  }
}