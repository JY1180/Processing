class Orb {
  PVector position, velocity, acceleration;
  int size;

  Orb(int x, int y, int s) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = s;
  }//constructor

  void display() {
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
    acceleration.add(force);
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
}//Orb
