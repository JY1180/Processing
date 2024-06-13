color A, T, C, G;
String[] nucleotides = {"A", "T", "C", "G"};

void setup() {
  size(600, 400);
  A = color(#C86B3B);
  T = color(#96527C);
  C = color(#75B0E2);
  G = color(#051D6E);
  
  drawStrand("ATCGTAGCTA", 100, 100, 20);
  boolean match = strandMatch("ATCGTAGCTA", "TAGCATCGAT");
  println(match);
  strandCompare("ATCGTAGCTA", "TAGCATCGAT", 100, 150, 20);
}//setup

void drawBase(char base, int x, int y, int sz) {
  noStroke();
  if (base == 'A') {
    fill(A);
  }//if
  else if (base == 'T') {
    fill(T);
  }//else if
  else if (base == 'C') {
    fill(C);
  }//else if
  else if (base == 'G'){
    fill(G);
  }//else if
  rect(x, y, sz, sz);
  fill(255);
  textSize(sz*2/3);
  text(base, x+sz/2, y+sz/2);
}//drawBase

void drawStrand(String dna, int x, int y, int sz) {
  for(int i=0; i<dna.length(); i++) {
    drawBase(dna.charAt(i), x+i*sz, y, sz);
  }//for
}//drawStrand

boolean strandMatch(String strand0, String strand1) {
  if(strand0.length() != strand1.length()) {
    return false;
  }//if
  for(int i=0; i<strand0.length(); i++) {
    if(strand0.charAt(i) != strand1.charAt(i)) {
      return false;
    }//if
  }//for
  return true;
}//strandMatch

void strandCompare(String strand0, String strand1, int x, int y, int sz) {
  for(int i=0; i<strand0.length(); i++) {
    if(strand0.charAt(i) == strand1.charAt(i)) {
      drawBase(strand0.charAt(i), x+i*sz, y, sz);
    }//if 
    else {
      stroke(255, 0, 0);
      noFill();
      rect(x+i*sz, y, sz, sz);
      drawBase(strand0.charAt(i), x+i*sz, y, sz);
      drawBase(strand1.charAt(i), x+i*sz, y+sz, sz);
      noStroke();
    }//else
  }//for
}//strandCompare
