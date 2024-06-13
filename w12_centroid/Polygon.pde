class Polygon extends PathShape {
  Point center;

  Polygon(int np, Point c, int minRadius, int maxRadius) {
    super(np, c, minRadius, maxRadius);
    center = c;
  }//Polygon

}//Polygon
