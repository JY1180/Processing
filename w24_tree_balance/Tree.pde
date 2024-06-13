class Tree {

  TreeNode root;
  PVector position;
  int totalLevels;

  Tree(int numLevels, int x, int y, int density) {
    position = new PVector(x, y);
    totalLevels = numLevels;
    root = makeTree(numLevels, position, density);
  }//constructor

  TreeNode makeTree(int numLevels, PVector p, int density) {
    if (numLevels == 0) {
      return null;
    }//base case
    else {
      char c = char(int(random(26)) + 'A');
      TreeNode tn = new TreeNode(c, p);

      float xoffset = width / (pow(2, totalLevels - numLevels+2));
      PVector leftP = new PVector(p.x + xoffset * -1, p.y + 75);
      PVector rightP = new PVector(p.x + xoffset, p.y + 75);

      if (random(100) < density ) {
        tn.left = makeTree(numLevels-1, leftP, density);
      }
      if (random(100) < density) {
        tn.right = makeTree(numLevels-1, rightP, density);
      }
      return tn;
    }//make more tree!
  }//makeTree

  void display() {
    display(root);
  }//display wrapper
  
  void display(TreeNode tn) {
    if (tn != null) {
      tn.display();
      display(tn.left);
      display(tn.right);
    }//if
  }//display
  
  String preOrder(TreeNode tn) {
    if (tn != null) {
      return tn.data + preOrder(tn.left) + preOrder(tn.right);
    }//if
    return "";
  }//preOrder

  String inOrder(TreeNode tn) {
    if (tn != null) {
      return inOrder(tn.left) + tn.data  + inOrder(tn.right);
    }//if
    return "";
  }//inOrder

  String postOrder(TreeNode tn) {
    if (tn != null) {
      return postOrder(tn.left)  + postOrder(tn.right) + tn.data ;
    }//if
    return "";
  }//postOrder
  
  int numNodes(TreeNode current) {
    if (current == null) {
      return 0;
    }//if
    return numNodes(current.left) + numNodes(current.left) + 1;
  }//numNodes
  
  int getHeight(TreeNode current) {
    if (current == null) {
      return 0;
    }//if
    int left = getHeight(current.left);
    int right = getHeight(current.right);
    if (left >= right) {
      return left + 1;
    }//if
    else if (right > left) {
      return right + 1;
    }//else if
    return 1;
  }//getHeight
  
  boolean isBalanced(TreeNode current) {
    if (current == null) {
      return true;
    }//if
    int left = getHeight(current.left);
    int right = getHeight(current.right);
    if (left == right || left+1 == right || left-1 == right) {
      return true;
    }//if
    return false;
  }//isBalanced
  
  void colorCode(TreeNode current) {
    if (current == null) {
      return;
    }//if
    if (isBalanced(current)) {
      current.c = color(255,255,0);
    }//if
    else {
      current.c = color(166,0,232);
    }//else
    colorCode(current.left);
    colorCode(current.right);
  }//colorCode

}//Tree
