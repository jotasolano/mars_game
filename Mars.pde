class Mars {

  float rocketW = 15;
  float rocketH = 60;
  float rocketVx = 0.05;
  float rocketVy = 0.05;
  float gravity = 0.0000001;
  float acceleration = 0.1;
  float angle = 0;
  float angleVar = PI / 100;

  float inc = 0.01;


  // Mars objects
  Rocket rocket;
  Terrain terrain;

  // Main constructor
  Mars() {
    rocket = new Rocket(30, 40, rocketW, rocketH, rocketVx, 
      rocketVy, gravity, angle, angleVar);

    terrain = new Terrain(inc);
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
  }

  // Key functions
  void pressedUp() {
    rocket.moveUp();
  }
  void pressedLeft() {
    rocket.moveLeft();
  }
  void pressedRight() {
    rocket.moveRight();
  }
}