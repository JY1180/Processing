PImage art;

void setup() {
  size(1145, 580);
  art = loadImage("art.jpg");
  art.loadPixels();
}//setup

void draw() {
  image(art, 0, 0);
  showTint(color(182, 139, 85));
}//draw

void keyPressed() {
  if (key == 'r' || key == 'R'){
    art = loadImage("art.jpg");
    loadImage("art.jpg");
  }//if
  else if (key == 'g' || key == 'G'){
    grayscale(art);
    art.updatePixels();
  }//else if
  else if (key == 'f' || key == 'F'){
    colorScale(art, color(182, 139, 85));
    art.updatePixels();
  }//else if
}//keyPressed

void grayscale(PImage img){
  for (int i=0; i < img.pixels.length; i++) {
    if (i < img.pixels.length){
      color c = img.pixels[i];
      float newC = (red(c) + green(c) + blue(c))/3;
      img.pixels[i] = color(newC);
    }//if
  }//for
}//greyscale

void colorScale(PImage img, color tint){
  for (int i=0; i < img.pixels.length; i++) {
    if (i < img.pixels.length){
      color c = img.pixels[i];
      float newC = ((red(c) + green(c) + blue(c))/3)/255;
      img.pixels[i] = color(red(tint)*newC,green(tint)*newC,blue(tint)*newC);
    }//if
  }//for
}//colorScale

void showTint(color tint){
  fill(red(tint), green(tint), blue(tint));
  rect(0,0,200,50);
  fill(255);
  textSize(25);
  text(red(tint) + "," + green(tint) + "," + blue(tint),5,25);
}
