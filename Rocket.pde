class Rocket {

  float x, y, w, h;
  float vx, vy;
  float angle, angleVar;
  float gravity;
  boolean landed;
  boolean fuel;

  Rocket(float x, float y, float w, float h, float vx, 
    float vy, float gravity, float angle, float angleVar) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vx = vx;
    this.vy = vy;
    this.gravity = gravity;
    this.angle = angle;
    this.angleVar = angleVar;
  }

  void render() {
    rectMode(CENTER);
    pushMatrix();
    pushStyle();

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
  }

  void moveUp(boolean fuel) {
    if (fuel == true) {
      y += vy * 10 * sin(angle - PI/2);
      x += vy * 10 * cos(angle - PI/2);
    }
  }

  void moveLeft() {
    angle -= angleVar;
    y -= vy * 10 * sin(angle);
    x -= vy * 10 * cos(angle);
  }

  void moveRight() {
    angle += angleVar;
    y += vy * 10 * sin(angle);
    x += vy * 10 * cos(angle);
  }
}