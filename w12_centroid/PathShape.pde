class PathShape {

  int DEFAULT_NUMPOINTS = 10;

  //vertext coordinates
  Point[] vertices;
  int numPoints;
  int setPoints;
  color inside;
  color border;
  Point centroid;
  float area;

  PathShape(int np) {
    numPoints = np;
    setPoints = 0;
    vertices = new Point[numPoints];
    inside = 255;
    border = 0;
    centroid = new Point(0, 0);
    area = 0;
  }//default contructor

  PathShape(int np, Point center, int minRadius, int maxRadius) {
    this(np);
    makeRandomClosedPolygon(center, minRadius, maxRadius);
    setArea();
    setCentroid();
  }//random closed polygon constructor

  PathShape (int np, int minX, int minY, int maxX, int maxY) {
    this(np);
    makeRandomVertices(minX, minY, maxX, maxY);
    setArea();
    setCentroid();
  }//random constructor

  void addPoint(int x, int y) {
    if (setPoints < numPoints) {
      vertices[setPoints] = new Point(x, y);
      setPoints++;
      setArea();
      setCentroid();
    }//add point if there's room
  }//addPoint

  void addPoint(Point p) {
    if (setPoints < numPoints) {
      vertices[setPoints] = p;
      setPoints++;
    }//add point if there's room
  }//addPoint

  void display() {
    fill(inside);
    stroke(border);
    beginShape();
    for (int p=0; p < setPoints; p++) {
      vertex(vertices[p].x, vertices[p].y);
    }//loop over vertices
    fill(255, 0, 0);
    ellipse(centroid.x, centroid.y, 5, 5);
  }//display

  void makeRandomVertices(int minX, int minY, int maxX, int maxY) {
    for(int p=0; p < numPoints; p++) {
      addPoint(new Point(minX, minY, maxX, maxY));
    }//generate points loop
  }//makeRandomVertices

  void makeRandomClosedPolygon(Point center, int minRadius, int maxRadius) {
    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int r = int(random(minRadius, maxRadius));
      int x = int(r * cos(theta)) + center.x;
      int y = int(r * sin(theta)) +  center.y;
      addPoint(x, y);
    }//generate points loop
  }//makeRandomClosedPolygon
  
  void setArea() {
    float sum = 0;
    for (int i = 0; i < setPoints; i++) {
      int x1 = vertices[i].x;
      int y1 = vertices[i].y; //<>//
      int x2 = 0, y2 = 0; //<>//
      if (i + 1 != setPoints) { //<>//
        x2 = vertices[(i+1)].x; //<>//
        y2 = vertices[(i+1)].y; //<>//
      }//if //<>//
      sum += x1 * y2 - x2 * y1; //<>//
    }//fori
    area = sum / 2;
  }//setArea
  
  void setCentroid() {
    float cx = 0;
    float cy = 0;
    float area = this.area;
    for (int i = 0; i < setPoints; i++) {
      int x1 = vertices[i].x;
      int y1 = vertices[i].y;
      int x2 = 0, y2 = 0;
      if (i + 1 != setPoints) {
        x2 = vertices[(i+1)].x;
        y2 = vertices[(i+1)].y;
      }//if
      cx += (x1 + x2) * (x1 * y2 - x2 * y1);
      cy += (y1 + y2) * (x1 * y2 - x2 * y1);
    }//fori
    centroid = new Point(int(cx/(6*area)), int(cy/(6*area)));
  }//setCentroid
}//PathShape
