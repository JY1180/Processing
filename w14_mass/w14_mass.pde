Orb[] orbs;
PVector gravity;
PVector wind;

void setup() {
  size(600, 400);
  orbs = new Orb[10];
  for (int i = 0; i < orbs.length; i++) {
    int x = (int) random(width);
    int y = 60;
    int size = (int) random(10, 50);
    float mass = random(10, 50);
    orbs[i] = new Orb(x, y, size, mass);
  }//fori
  gravity = new PVector(0, 0.3);
  wind = new PVector(0, 0);
}//setup

void draw() {
  background(255);
  for (int i = 0; i < orbs.length; i++) {
    orbs[i].applyForce(gravity);
    orbs[i].applyForce(wind);
    orbs[i].run();
    orbs[i].display();
  }//fori
}//draw

void keyPressed(){
  if (keyCode == LEFT) {
    wind.sub(0.1, 0);
  } //if
  else if (keyCode == RIGHT) {
    wind.add(0.1, 0);
  }//else if
}//keyPressed
