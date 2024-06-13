PImage art;

void setup() {
  size(1145, 580);
  art = loadImage("art.jpg");
  art.loadPixels();
  image(art, 0, 0);
}

void draw() {
  image(art, 0, 0);
}

void keyPressed() {
  if (key == 'r' || key == 'R'){
    art = loadImage("art.jpg");
    loadImage("art.jpg");
  }
  else if (key == 'q' || key == 'Q'){
    colorQuad(art);
    art.updatePixels();
  }
}

void colorQuad(PImage img){
  for (int i=0; i < img.pixels.length; i++) {
    if (i < img.pixels.length/2 && width/2 > i % 1145){
      color c = img.pixels[i];
      color newC = color( red(c), green(c), 0);
      img.pixels[i] = newC;
    }
    else if (i < img.pixels.length/2 && width/2 < i % 1145){
      color c = img.pixels[i];
      color newC = color( red(c), 0, blue(c));
      img.pixels[i] = newC;
    }
    else if (i > img.pixels.length/2 && width/2 > i % 1145){
      color c = img.pixels[i];
      color newC = color( 0, green(c), blue(c));
      img.pixels[i] = newC;
    }
  }
}
