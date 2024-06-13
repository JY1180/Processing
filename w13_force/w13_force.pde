Orb orb1, orb2;
PVector gravity, wind;

void setup() {
  size(600, 400);
  orb1 = new Orb(int(random(width)), int(random(height)), 25);
  orb2 = new Orb(int(random(width)), int(random(height)), 25);
  gravity = new PVector(0, 0.1);
  wind = new PVector(0.1, 0);
}

void draw() {
  background(255);
  orb1.applyForce(gravity);
  orb2.applyForce(wind);
  orb1.run();
  orb2.run();
  orb1.display();
  orb2.display();
}
