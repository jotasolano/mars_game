class Rocket {

  float x, y, w, h;
  float vx, vy;
  float ax, ay;
  float angle, angleVar;
  float gravity;
  boolean landed;
  boolean fuel;
  float currentSpeed;
  float maxSpeed;
  int m = 0;
  float scayl = 1.0;

  PVector position, velocity, acceleration, thrust, g;
  float mass;

  Rocket(float mass, float x, float y, float scayl) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.scayl = scayl;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    thrust = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    g = new PVector(0, 0.005);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void gravity() {
    velocity.add(g).limit(0.05);
  }

  void rot(PVector v, float theta) {
    float m = v.mag();
    float a = v.heading();
    a += theta;

    v.x = m * cos(a);
    v.y = m * sin(a);
  }

  void render(PVector v) {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    translate(position.x, position.y);
    rotate(v.heading());
    println(v.heading());
    float len = v.mag()*scayl;
    stroke(0);
    fill(255);
    rect(v.x, v.y, 10, 40);
    line(len, 0, 0, -40);
    popStyle();
    popMatrix();
  }

  //void fall() {
  //  vy += gravity;
  //  x += vx;
  //  y += vy;
  //  y += (maxSpeed/100) * sin(angle - PI/2);
  //  x += (maxSpeed/100) * cos(angle - PI/2);
  //}


  //void moveUp(boolean fuel) {
  //  if (fuel == true) {
  //    currentSpeed = m++;
  //    maxSpeed = constrain(currentSpeed, 0, 100);
  //    println(maxSpeed + " " + frameCount);
  //  }
  //}

  //void moveLeft() {
  //  angle -= angleVar;
  //  y -= vy * sin(angle);
  //  x -= vy * cos(angle);
  //}

  //void moveRight() {
  //  angle += angleVar;
  //  y += vy * sin(angle);
  //  x += vy * cos(angle);
  //}

  // Collision + landing detection
  void checkLanding() {
    // check if the rocket is not too tilted (-5 to 5 degrees)
    // this doesn't work because the angle keeps adding to itself
    if (angle > -0.1 && angle < 0.1) {
      println("rocket is vertical", angle);
    } else {
      println("rocket is tilted", angle);
    }
  }
}