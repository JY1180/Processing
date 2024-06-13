void setup() {
  size(400, 400);
  PathShape shapey = new PathShape(4);

  shapey.addPoint(50, 200);
  shapey.addPoint(200, 50);
  shapey.addPoint(350, 200);
  shapey.addPoint(200, 350);

  shapey.display();
}//setup
