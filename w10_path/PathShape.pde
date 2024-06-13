class PathShape {
  Point[] vertices;
  int numPoints;
  int setPoints;
  color border;
  color inside;
  
  PathShape(int numPoints) {
    this.numPoints = numPoints;
    this.setPoints = 0;
    this.vertices = new Point[numPoints];
    this.border = color(0);
    this.inside = color(255);
  }//constructor
  
  void addPoint(int x, int y) {
    if (setPoints >= numPoints) {
      return;
    }//if
    vertices[setPoints] = new Point(x, y);
    setPoints++;
  }//addPoint
  
  void display() {
    stroke(border);
    fill(inside);
    beginShape();
    for (int i = 0; i < setPoints; i++) {
      vertex(vertices[i].x, vertices[i].y);
    }//fori
    endShape(CLOSE);
  }//display
}//PathShape
