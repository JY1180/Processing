Tree oak;


void setup() {
  size(800, 500);

  oak = new Tree(4, width/2, 50, 60);
  oak.display(oak.root);
  println(oak.numNodes(oak.root));

}//setup
