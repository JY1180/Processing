class PathShape {
  Point[] vertices;
  int numPoints;
  int setPoints;
  color border;
  color inside;

  // Constructor that takes the number of points as a parameter
  PathShape(int numPoints) {
    this.numPoints = numPoints;
    this.setPoints = 0;
    this.vertices = new Point[numPoints];
    this.border = color(0);
    this.inside = color(255);
  }

  // Random constructor that takes ranges for x and y coordinates
  PathShape(int numPoints, int minX, int minY, int maxX, int maxY) {
    this(numPoints);
    makeRandomVertices(minX, minY, maxX, maxY);
  }

  // Random closed polygon constructor that takes center and radius range
  PathShape(int numPoints, Point center, int minRadius, int maxRadius) {
    this(numPoints);
    makeRandomClosedPolygon(center, minRadius, maxRadius);
  }

  void addPoint(int x, int y) {
    if (setPoints >= numPoints) {
      return;
    }
    vertices[setPoints] = new Point(x, y);
    setPoints++;
  }

  void display() {
    stroke(border);
    fill(inside);
    beginShape();
    for (int i = 0; i < setPoints; i++) {
      vertex(vertices[i].x, vertices[i].y);
    }
    endShape(CLOSE);
  }

  // Generate numPoints random vertices with x and y values within the given ranges
  void makeRandomVertices(int minX, int minY, int maxX, int maxY) {
    for (int i = 0; i < numPoints; i++) {
      int x = (int) random(minX, maxX);
      int y = (int) random(minY, maxY);
      vertices[i] = new Point(x, y);
      setPoints++;
    }
  }

  // Generate numPoints random vertices that form a closed polygon with center and radius range
  void makeRandomClosedPolygon(Point center, int minRadius, int maxRadius) {
    for (int i = 0; i < numPoints; i++) {
      float theta = i * TWO_PI / numPoints;
      float radius = random(minRadius, maxRadius);
      int x = (int) (radius * cos(theta) + center.x);
      int y = (int) (radius * sin(theta) + center.y);
      vertices[i] = new Point(x, y);
      setPoints++;
    }
  }
}
