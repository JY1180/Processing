String s0 = "tcgcagctcgaaccactatg";
String s1 = "agcgtcgagcttggtgatac";
String s2 = "atcgtccagctatgtgatac";
String s3 = "caatcacctgagtatcgcga";
String protein0 = "atgtcgcagctcgaaccactgtga";
String protein1 = "tcgatgcagctcgaaccactgtag";
String noProtein0 = "tcgatgcagctcgaaccactg";
String noProtein1 = "tcgcagctcgaaccactgtag";
String noProtein2 = "tcgtagcagctcgaaccactgatg";
String noProtein3 = "atgtcgcagtaactcgaaccactg";
String noProtein4 = "tcgatgcagctcgaacactgtag";

int NUC_SIZE = 30;

void setup() {
  size(800, 200);
  background(0);
  textAlign(LEFT, TOP);

  strandCompare(s0, s1, 0, 0, NUC_SIZE);

  strandCompare(s0, s2, 0, NUC_SIZE*3, NUC_SIZE);

  //strandMatch tests
  println(strandMatch(s0, s1)); //correct match
  println(strandMatch(s0, s0)); //strand should not match itself
  println(strandMatch(s0, s2)); //mismatch
  
  // Testing findCodon()
  int index = findCodon(protein0, "a");
  println("Index of " + "a" + ": " + index);
  
  // Testing findProteinStart()
  int start0 = findProteinStart(protein0);
  println("Protein 0 start: " + start0);
  
  int start1 = findProteinStart(protein1);
  println("No start codon: " + start1);
  
  // Testing findProteinEnd()
  int end0 = findProteinEnd(protein1);
  println("Protein 1 end: " + end0);
  
  int end1 = findProteinEnd(noProtein0);
  println("No end codon: " + end1);
  
  int end2 = findProteinEnd(noProtein1);
  println("Not multiple of three: " + end2);
  
  // Testing containsProtein()
  boolean hasProtein = containsProtein(noProtein2);
  println("Contains protein: " + hasProtein);
  
  boolean hasNoProtein = containsProtein(noProtein3);
  println("No protein: " + hasNoProtein);
}//setup

void strandCompare(String strand0, String strand1, int x, int y, int sz) {
  //set strands to upper case to avoid any confusion
  strand0 = strand0.toUpperCase();
  strand1 = strand1.toUpperCase();

  //draw both strands
  drawStrand(strand0, x, y, sz);
  drawStrand(strand1, x, y+sz, sz);

  //draw any mismatch squares
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  for(int b=0; b < strand0.length(); b++) {
    if ( !basePairMatch(strand0.charAt(b), strand1.charAt(b)) ) {
      rect(x, y, sz, sz*2);
    }//base par mismtch
    x+= sz;
  }//loop through base pairs
}//strandCompare


boolean strandMatch(String strand0, String strand1) {
  //set strands to upper case to avoid any confusion
  strand0 = strand0.toUpperCase();
  strand1 = strand1.toUpperCase();
  if (strand0.length() != strand1.length()) {
    return false;
  }//size mismatch

  for(int b=0; b < strand0.length(); b++) {
    if ( !basePairMatch(strand0.charAt(b), strand1.charAt(b)) ) {
      return false;
    }//base par mismtch
  }//loop through base pairs
  return true;
}//strandMatch

boolean basePairMatch(char b0, char b1) {
  if ((b0 == 'A' && b1 == 'T') || (b0 == 'T' && b1 == 'A')) {
    return true;
  }//AT
  if ((b0 == 'C' && b1 == 'G') || (b0 == 'G' && b1 == 'C')) {
    return true;
  }//CG
  return false;
}//basePairMatch

void drawStrand(String dna, int x, int y, int sz) {
  dna = dna.toUpperCase();
  for (int i=0; i<dna.length(); i++) {
    drawBase(dna.charAt(i), x, y, sz);
    x+= sz;
  }//loop through chars
}//drawStrand

void drawBase(char base, int x, int y, int sz) {
  noStroke();
  fill(charToColor(base));
  square(x, y, sz);

  fill(255);
  textSize(sz);
  text(base, x, y);
}//drawBase


color charToColor(char c) {
  color col = color(0);
  if (c == 'A') {
    col = #F5793A;
  }
  else if (c == 'T') {
    col = #A95AA1;
  }
  else if (c == 'C') {
    col = #85C0F9;
  }
  else if (c == 'G') {
    col = #0F2080;
  }
  return col;
}//charTocolor

int findCodon(String strand, String codon) {
  int index = strand.indexOf(codon);
  return index;
}

int findProteinStart(String strand) {
  int index = strand.indexOf("atg");
  return index;
}

int findProteinEnd(String strand) {
  int index = -1;
  String[] endCodons = {"taa", "tag", "tga"};
  for (String codon : endCodons) {
    int tempIndex = strand.indexOf(codon, findProteinStart(strand) + 3);
    if (tempIndex != -1 && (tempIndex - findProteinStart(strand)) % 3 == 0) {
      index = tempIndex;
      break;
    }
  }
  return index;
}

boolean containsProtein(String dna) {
  int start = findProteinStart(dna);
  int end = findProteinEnd(dna);
  if (start == -1 || end == -1 || end - start < 9) {
    return false;
  } else {
    return true;
  }
}

String getProtein(String strand) {
    int start = findProteinStart(strand);
    int end = findProteinEnd(strand);
    if (start == -1 || end == -1 || (end - start) % 3 != 0 || (end - start) < 12) {
        return "";
    }
    return strand.substring(start + 3, end);
}

String getAllProteins(String strand) {
    String proteins = "";
    int start = findProteinStart(strand);
    while (start != -1) {
        int end = findProteinEnd(strand.substring(start));
        if (end == -1 || (end - start) % 3 != 0 || (end - start) < 12) {
            start = findProteinStart(strand.substring(start + 1));
            continue;
        }
        String protein = strand.substring(start + 3, start + end);
        proteins += protein + "\n";
        start = findProteinStart(strand.substring(start + end + 1));
    }
    return proteins;
}
