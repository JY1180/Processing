class Tree {
  TreeNode root;
  PVector positon;
  int totalLevels;
  
  Tree(int x, int y, int numLevels) {
    PVector position = new PVector(x,y);
    TreeNode root = new TreeNode('a', position);
    totalLevels = numLevels;
    root.left = makeTree(x, y, totalLevels-1);
    root.right = makeTree(x, y, totalLevels-1);
    this.display(root);
  }//Tree
  
  TreeNode makeTree(int x, int y, int numLevels) {
    if (numLevels == 0) {
      return null;
    }//if
    PVector position2 = new PVector(x,y);
    TreeNode child = new TreeNode('a', position2);
    numLevels--;
    println('1');
    return child;
  }//makeTree
  
  void display(TreeNode current) {
    if (current != null) {
      current.display();
    }//if
  }//display
  
}//Tree
