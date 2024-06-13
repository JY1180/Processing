void setup() {
  size(400, 400);
  PathShape shapey = new PathShape(4);

  shapey.addPoint(50, 200);
  shapey.addPoint(200, 50);
  shapey.addPoint(350, 200);
  shapey.addPoint(200, 350);

  shapey.display();
}

void keyPressed(){  
  if (key == 'R'){
  background(255);
  Point center = new Point(width/2, height/2);
  PathShape shapey1 = new PathShape(8, center, 50, 150);
  shapey1.display();
  }
}
