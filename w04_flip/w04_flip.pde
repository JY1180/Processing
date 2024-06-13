PImage art;

void setup() {
  size(1145, 580);
  art = loadImage("art.jpg");
  art.loadPixels();
}

void draw() {
  image(art, 0, 0);
}

void keyPressed() {
  if (key == 'r' || key == 'R'){
    art = loadImage("art.jpg");
    loadImage("art.jpg");
  }
  else if (key == 'h' || key == 'H'){
    save("art2.jpg");
    horizontalFlip(art);
  }
  else if (key == 'v' || key == 'V'){
    save("art2.jpg");
    verticalFlip(art);
  }
  else if (key == 'm' || key == 'M'){
    save("art2.jpg");
    mirror(art);
  }
}

void horizontalFlip(PImage pic) {
  PImage tmp = new PImage(width, height);
  for (int i = 0; i <= (width-1)*(height-1); i++){
    color newC = pic.pixels[(width-1)*(height-1)-i];
    tmp.pixels[i] = newC;
    tmp.updatePixels();
  }
}

void verticalFlip(PImage pic) {
  PImage tmp = new PImage(width, height);
  for (int i = (width-1)*(height-1); i >= 0; i--){
    color newC = pic.pixels[(width-1)*(height-1)-i];
    tmp.pixels[i] = newC;
    tmp.updatePixels();
  }
}

void mirror(PImage pic) {
  PImage tmp = new PImage(width, height);
  for (int i = 0; i <= (width-1)*(height-1)/2; i++){
    color newC = pic.pixels[(width-1)*(height-1)-i];
    tmp.pixels[i] = newC;
    tmp.updatePixels();
  }
}
