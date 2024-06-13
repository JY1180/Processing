float GRAVITY = 0.4;
int MAX_SIZE  = 50;
int MIN_SIZE = 10;
float MAX_MASS = 10;
float MIN_MASS = 1;
float DAMPENING = 1;//0.996;

float SPRING_CONST = 0.005;
int SPRING_LENGTH = 100;
int NUM_ORBS = 10;

boolean moving;
boolean bounce;

Orb[] orbs;
FixedOrb earth;

void setup() {
  size(600, 600);
  background(255);
  reset();
}//setup

void draw() {

  background(255);
  displayMode();

  if (moving) {

    for (int i=0; i < orbs.length; i++) {
      orbs[i].run(bounce, DAMPENING);
      orbs[i].display();
      for (int j=0; j < orbs.length; j++) {
        if(orbs[i] != orbs[j]){
          drawSpring(orbs[i], orbs[j]);
          orbs[i].applyForce(orbs[i].getSpring(orbs[j], SPRING_LENGTH, SPRING_CONST));
        }//if
      }//forj
    }//run orbs
  }//moving

}//draw

void drawSpring(Orb o0, Orb o1) {
  line(o0.position.x, o0.position.y, o1.position.x, o1.position.y);
  stroke(0);
  if(dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) > SPRING_LENGTH){
    stroke(255,0,0);
  }//if
  else if(dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) == SPRING_LENGTH){
    stroke(0,0,0);
  }//else if
  else if(dist(o0.position.x, o0.position.y, o1.position.x, o1.position.y) < SPRING_LENGTH){
    stroke(0,255,0);
  }//else if
}//drawSpring

void reset() {
  moving = false;
  bounce = false;
  orbs = new Orb[NUM_ORBS];
  for (int i=0; i < orbs.length; i++) {
    int mid = orbs.length/2;
    if(orbs[i] == orbs[mid]){
      orbs[i] = new FixedOrb(int(random(0,width)),int(random(0,height)), 25, 5);
    }//if
    else{
      orbs[i] = new Orb(int(random(0,width)),int(random(0,height)), 25, 5);
    }//else
  }//fori
}//reset


void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'b') {
    bounce = !bounce;
  }
  if (key == 'r') {
    reset();
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
  c = bounce ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(54, 0, 57, 20);

  stroke(0);
  fill(0);
  text("MOVING", 1, 0);
  text("BOUNCE", 55, 0);
}
