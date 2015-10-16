void setup()  {
  
  size(640, 360, P3D);
  noStroke();
  fill(204);
  frameRate(selectedFrameRate);
  
}

float selectedFrameRate = 24;

void draw()  {
  
  background(125, 159, 53);
  
  lights();
  //spotLight(203, 135, 175, width/2, height/2, 400, 0, 0, -1, PI/4, 2);

  //cameraPosition();
   
  float angle = PI/3 + ((float)frameCount / selectedFrameRate) * (2 * PI) / 4;
  float z = 80 * sin(((float)frameCount / selectedFrameRate) * (2 * PI) / 2);

  //int numberOfCubes = 5;
  //for(int cubeIndex=-numberOfCubes; cubeIndex<numberOfCubes; cubeIndex++){
  //  drawSingleCube(angle, cubeIndex, numberOfCubes);
  //}
  
  for(int xPosition = 0; xPosition < width; xPosition += 100){
    for(int yPosition = 0; yPosition < height; yPosition += 100){
      newCube(xPosition, yPosition, angle, z);
    }    
  }

}

void newCube(int xPosition, int yPosition, float angle, float z){
  pushMatrix();
  translate(xPosition, yPosition, z);
  rotateY(1.25 + angle);
  rotateX(-0.4 + 0.2 * angle);
  noStroke();
  box(40);
  popMatrix(); 
}

void cameraPosition(){
  float fov = PI/3.0; 
  float cameraZ = (height/2.0) / tan(fov/2.0); 
  perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*10.0);  
  spotLight(203, 135, 175, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
}

void drawSingleCube(float angle, int index, int total){
  translate((1+index*(width/2)/total), height/2);
  //rotateX(-PI/6); 
  //rotateY(angle);
  box(40);
}