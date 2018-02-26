class Booster {

  // Forces acting on the ship
  PVector thrust;
  PVector gravity;
  PVector wind;

  // Parameters that will be computed for the ship every frame 
  PVector acceleration;
  PVector velocity;
  PVector position;

  float maxSpeed = 4;
  float gForce = 0.001;
  float windForce = 0.0001;
  float damping = 0.990;
  float thrustCount = 0;
  
  boolean engineRunning = false;

  float w = 10;
  float h = 40;
  
  PImage boosterPng, burstLo, burstMi, burstHi;

  Booster(PVector position, float angle) {
    this.thrust = new PVector(0.00001, 0, 0);
    this.thrust.rotate(angle);
    this.gravity = new PVector(0, gForce, 0);
    this.wind = new PVector(windForce, 0, 0);

    this.acceleration = new PVector();
    this.velocity = new PVector();
    this.position = position;
    
    boosterPng = loadImage("boosterImg2x.png");
    burstLo = loadImage("burst_lo.png");
    burstMi = loadImage("burst_mi.png");
    burstHi = loadImage("burst_hi.png");
    
    boosterPng.resize(80,30);
    
    
  }

  // Based on the nature of code
  void update() {
    // Compute the global acceleration based on external forces, and apply it to vel + pos

    acceleration.set(0, 0, 0);  // reset acc
    acceleration.add(thrust);
    acceleration.add(gravity);
    acceleration.add(wind);

    // Now update the rest
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);

    if (thrustCount > 0.00000001) {
      engineRunning = true;
    } else {
      engineRunning = false;
    }

    // Out of bounds
    if (position.x >= width) {
      position.x = 0;
    } else if (position.x < 0) {
      position.x = width - 1;
    }
    
    // Stop rocket once fuel reaches 0
    
  }

  void turn(float angleInc) {
    thrust.rotate(angleInc);
    engineRunning = true;
  }

  void render() {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    imageMode(CENTER);
    translate(position.x, position.y);
    rotate(thrust.heading());
    stroke(0);
    fill(255);
    image(boosterPng, 0, 0);
    boosterPng.updatePixels();
    println(thrustCount);
    if (thrustCount > 0.00000001) {
      image(burstLo, -35, 0);
      if (thrustCount > 0.006) {
        image(burstMi, -42, 0);
      }
      if(thrustCount > 0.01) {
        image(burstHi, -50, 0);
      }
    }
    popStyle();
    popMatrix();
  }

  // A debugging function to help you visualize what's going on with the forces
  void visualizeForces() {
    pushMatrix();
    pushStyle();

    translate(position.x, position.y);
    stroke(255, 0, 0);
    strokeWeight(5); 
    line(0, 0, 1000 * thrust.x, 1000 * thrust.y);
    stroke(0, 255, 0);
    //line(0, 0, 1000 * gravity.x, 1000 * gravity.y);
    //line(0, 0, 1000 * wind.x, 1000 * wind.y);

    strokeWeight(3);
    stroke(0, 0, 255);
    line(0, 0, 100 * acceleration.x, 100 * acceleration.y);
    line(0, 0, 100 * velocity.x, 100 * velocity.y);

    popStyle();
    popMatrix();
  }

  // Increase the thrust length by a factor
  void thrust(float inc) {
    thrust.limit(0.01);
    float dt = thrust.mag() + inc;  // remember inc could be negative
    if (dt <= 0) {
      dt = 0.00000001;  // let's keep it very low so that we do not lose the vector orientation
    }
    thrust.setMag(dt);
    thrustCount =+ dt;
  }
}