class Orb {
  PVector position, velocity, acceleration;
  int size;
  float mass;
  
  Orb(int x, int y, int s, float m) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = s;
    mass = m;
  }//constructor
  
  void display() {
    float density = getDensity();
    fill(255, 0, 0, density * 255);
    circle(position.x, position.y, size);
  }//display
  
  void run() {
    velocity.add(acceleration);
    if (checkYBoundary()) {
      velocity.y *= -1;
    }//if
    if (checkXBoundary()) {
      velocity.x *= -1;
    }//if
    position.add(velocity);
    acceleration.set(0,0);
  }//run
  
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }//applyForce
  
  boolean checkYBoundary() {
    boolean check = position.y >= height - size/2;
    check = check || (position.y <= size/2);
    return check;
  }//checkYBoundary
  
  boolean checkXBoundary() {
    boolean check = position.x >= width - size/2;
    check = check || (position.x <= size/2);
    return check;
  }//checkXBoundary
  
  float getDensity() {
    return mass / (PI * size * size / 4);
  }//getDensity
}
