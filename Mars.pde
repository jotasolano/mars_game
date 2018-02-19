class Mars {

  float rocketW = 15;
  float rocketH = 60;
  float rocketVx = 0.05;
  float rocketVy = 0.05;
  float gravity = 0.0000001;
  float acceleration = 0.1;
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
    rocket = new Rocket(30, 40, rocketW, rocketH, rocketVx, 
      rocketVy, gravity, angle, angleVar);

    terrain = new Terrain(inc);
    hud = new HUD();
  }

  // setting the vertices for terrain only once
  void setMars() {
    terrain.createTerrain();
  }

  // Running
  void run() {
    // Physics
    rocket.fall();

    // Draw
    rocket.render();
    terrain.render();
    hud.renderFuel();
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