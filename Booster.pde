class Booster {
  PVector position;
  PVector velocity;
  PVector acceleration;

  float maxSpeed = 4;
  float gForce = 0.001;
  float wind = 0.0005;
  float damping = 0.990;

  float w = 10;
  float h = 40;

  float heading = 0;

  boolean thrusting = false;

  Booster() {
    position = new PVector(width/2, height/2);
    velocity = new PVector();
    acceleration = new PVector();
  }

  // Based on the nature of code
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);

    position.add(velocity);
    acceleration.mult(0);
    applyGravity();
  }

  // Pseudo Newton's second law
  void applyForce(PVector force) {
    PVector f = force.copy();
    acceleration.add(f);
  }

  void turn(float angle) {
    heading += angle;
  }

  void applyGravity() {
    PVector gravity = new PVector(wind, gForce);
    applyForce(gravity);
  }

  void applyThrust() {
    float angle = heading - PI/2;

    // Polar to cartesian
    PVector force = new PVector(cos(angle), sin(angle));
    force.mult(0.01);
    applyForce(force);

    thrusting = true;
  }

  void reduceThrust() {
    float angle = heading - PI/2;

    // Polar to cartesian
    PVector force = new PVector(cos(angle + PI), sin(angle  + PI));
    force.mult(0.01);
    if (acceleration.mag() == 0) {
      println("zero");
    }
    applyForce(force);

    thrusting = true;
  }

  void render() {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(heading);
    stroke(0);
    fill(255);
    rect(0, 0, 10, 40);
    line(0, 0, 0, -40);
    popStyle();
    popMatrix();

    thrusting = false;
  }



  void moveLeft() {
    this.turn(-0.02);
  }

  void moveRight() {
    this.turn(0.02);
  }

  void thrust() {
    this.applyThrust();
  }

  void reduce() {
    this.reduceThrust();
  }
}