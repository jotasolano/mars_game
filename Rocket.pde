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

  Rocket(float x, float y, float w, float h, float gravity, float angle, 
    float angleVar, float ax, float ay) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.gravity = gravity;
    this.angle = angle;
    this.angleVar = angleVar;
    this.ax = ax;
    this.ay = ay;

    vx = ax;
    vy = ay;
  }

  void render() {
    pushMatrix();
    pushStyle();
    rectMode(CENTER);
    translate(x, y);
    rotate(angle); 
    stroke(0);
    fill(255);
    rect(0, 0, w, h);
    line(0, 0, 0, -40);

    popStyle();
    popMatrix();
  }

  void fall() {
    vy += gravity;
    x += vx;
    y += vy;
    y += (maxSpeed/100) * sin(angle - PI/2);
    x += (maxSpeed/100) * cos(angle - PI/2);
  }

  void moveUp(boolean fuel) {
    if (fuel == true) {
      currentSpeed = m++;
      maxSpeed = constrain(currentSpeed, 0, 100);
      println(maxSpeed + " " + frameCount);
    }
  }

  void moveLeft() {
    angle -= angleVar;
    y -= vy * sin(angle);
    x -= vy * cos(angle);
  }

  void moveRight() {
    angle += angleVar;
    y += vy * sin(angle);
    x += vy * cos(angle);
  }

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