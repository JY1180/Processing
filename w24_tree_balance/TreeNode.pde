class TreeNode {

  TreeNode left;
  TreeNode right;
  char data;

  int size;
  color c;
  PVector position;


  TreeNode(char d, PVector p) {
    data = d;
    position = p;
    size = 25;
    c = 255;
  }//constructor

  void display() {
    if (left != null) {
      stroke(230, 0, 230);
      line(position.x, position.y, left.position.x, left.position.y);
    }//left line

    if (right != null) {
      stroke(0, 230, 230);
      line(position.x, position.y, right.position.x, right.position.y);
    }//right line

    textAlign(CENTER, CENTER);
    textSize(size - 5);
    fill(c);
    stroke(0);
    circle(position.x, position.y, size);
    fill(0);
    text(data, position.x, position.y);
  }//display


}//TreeNode
