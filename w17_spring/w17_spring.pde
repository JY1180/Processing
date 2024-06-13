float GRAVITY = 0.4;
int MAX_SIZE  = 50;
int MIN_SIZE = 10;
float MAX_MASS = 10;
float MIN_MASS = 1;
float DAMPENING = 0.998;


float SPRING_CONST = 0.005;
int SPRING_LENGTH = 100;

boolean moving;

int NUM_ORBS = 10;
Orb o;
FixedOrb fixed;
FixedOrb earth;

void setup() {
  size(600, 600);
  background(255);
  moving = false;

  fixed = new FixedOrb(width/2, height/2 - SPRING_LENGTH, 10, 1);
  earth = new FixedOrb(width/2, height * 100, 1, 500);
  o = new Orb(width/2 + 50, height/2 + SPRING_LENGTH, 25, 5);
}//setup

void draw() {

  background(255);
  displayMode();
  if (moving) {
    PVector spring = o.getSpring(fixed, SPRING_LENGTH, SPRING_CONST);
    PVector g = o.getGravity(earth, GRAVITY);
    o.applyForce(spring);
    o.applyForce(g);
    o.run(false, DAMPENING);
  }//moving

  drawSpring(o, fixed);
  o.display();
  fixed.display();
}//draw

void drawSpring(Orb o0, Orb o1) {
  line(o0.position.x, o0.position.y, o1.position.x, o1.position.y);
}




void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (keyCode == DOWN) {
    o.position.y+= 2;
  }
  if (keyCode == UP) {
    o.position.y-= 2;
  }
}//keyPressed

void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();
  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  stroke(0);

  fill(0);
  text("MOVING", 1, 0);
}
