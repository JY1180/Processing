class Triangle extends PathShape {

  Triangle() {
    super(3);
  }//default constructor

  Triangle(Point center, int minRadius, int maxRadius) {
    super(3, center, minRadius, maxRadius);
  }//random constructor

  Triangle(int minX, int minY, int maxX, int maxY) {
    super(3, minX, minY, maxX, maxY);
  }//other random constructor

}//Triangle
