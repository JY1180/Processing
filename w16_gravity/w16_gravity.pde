Orb orb1, orb2;
int MIN_MASS = 1, MAX_SIZE = 10, MAX_MASS = 10, MIN_SIZE = 1;

void setup() {
  size(400, 400);
  orb1 = new Orb(100, 200, 50, 10);
  orb2 = new Orb(300, 200, 50, 10);
}

void draw() {
  background(255);
  
  PVector gravity1 = orb1.getGravity(orb2, 0.1);
  PVector gravity2 = orb2.getGravity(orb1, 0.1);
  
  orb1.applyForce(gravity1);
  orb2.applyForce(gravity2);
  
  orb1.run(true);
  orb2.run(true);
  
  orb1.display();
  orb2.display();
}
