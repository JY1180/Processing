class OrbNode extends Orb {

  OrbNode next;
  OrbNode previous;

  OrbNode(int x, int y, int s, float m) {
    super(x, y, s, m);
  }//constructor
  
  void display(int springLength){
    super.display();
    if (springLength > SPRING_LENGTH){
      stroke(0,0,255);
    }//if
    else if (springLength < SPRING_LENGTH){
      stroke(255,0,0);
    }//else if
     if (next != null){
      line(this.position.x, this.position.y, next.position.x, next.position.y);
    }//if
  }//display
  
  void applySprings(int springLength, float springK){
    if (previous != null){
      PVector last = previous.getSpring(this, springLength, springK);
      super.applyForce(last);
    }//if
    if (next != null){
      PVector front = next.getSpring(this, springLength, springK);
      super.applyForce(front);
    }//if
  }//applySprings

}//class OrbNode
