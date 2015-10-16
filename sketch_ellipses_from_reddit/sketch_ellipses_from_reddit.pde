void setup() {
  size(1200, 1200);  
  smooth();
  strokeWeight(1);
  colorMode(HSB, 360);
  background(0);
  frameRate(96);
}
 
float offset = 0;
void draw() {
   background(0);
   drawEllipse(offset);
   offset += 0.7;
}

void drawEllipse(float offset){
  translate(width/2, height/2);
  for (int deg = 0; deg < 360; deg++) {
    pushMatrix();
    rotate(radians(deg+offset));
    translate(0, 0.3 * height);
    //scale(map(sin(radians(deg * 5.5), -1, 1, 0.5, 1), map(sin(radians(deg*11)), -1, 1, 0.5, 1));
    scale(map(sin(radians((deg+offset)*11)), -1, 1, 0.5, 1), map(sin(radians(deg*11)), -1, 1, 0.5, 1));
    noFill();
    stroke(deg, 200, 350);
    ellipse(0, 0, 0.2 * width, 0.2 * width);
    popMatrix();
  }
}