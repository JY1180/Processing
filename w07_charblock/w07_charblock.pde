void setup(){
  size(600,300);
  background(0);
  textAlign(LEFT, TOP);
  int x = 0, y = 0;
  for (char i = 'A'; i <= 'Z'; i++){
    drawChar(i, x, y);
    x += i;
    if (x + i > width){
      x = 0;
      y += i;
    }
  }
}

color charToColor(char c){
  int R, G, B;
  R = c * 23;
  G = c * 41;
  B = c * 67;
  if (R > 255){
    while (R > 255){
      R -= 255;
    }
  }
  if (G > 255){
    while (G > 255){
      G -= 255;
    }
  }
  if (B > 255){
    while (B > 255){
      B -= 255;
    }
  }
  color colorr = color(R, B, G);
  return colorr;
}

void drawChar(char c, int x, int y){
  color colorr = charToColor(c);
  fill(colorr);
  rect(x, y, x + c, y + c);
  textSize(c);
  fill(255);
  text(c, x, y);
}
