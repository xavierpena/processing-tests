void setup()  {
  
  size(1024,765, P3D); //640, 360
  noStroke();
  fill(204);
  frameRate(selectedFrameRate);
  back = loadImage("C:\\Users\\xavier.pena\\Documents\\Processing\\my_files\\sketch_3d_cube_rotating_v03\\color-pattern.jpg");
}

PImage back;
float selectedFrameRate = 24;

void draw()  {
  
  //background(125, 159, 53);
  background(back);
  
  lights();
  //spotLight(203, 135, 175, width/2, height/2, 400, 0, 0, -1, PI/4, 2);

  //cameraPosition();
   
  float angle = PI/3 + ((float)frameCount / selectedFrameRate) * (2 * PI) / 4;

  //int numberOfCubes = 5;
  //for(int cubeIndex=-numberOfCubes; cubeIndex<numberOfCubes; cubeIndex++){
  //  drawSingleCube(angle, cubeIndex, numberOfCubes);
  //}

  int increment = 100;
  int count = 0;
  int totalCount = (width / increment) * (height / increment);
  
  for(int yPosition = 0; yPosition < height; yPosition += increment){
    for(int xPosition = 0; xPosition < width; xPosition += increment){
      float z = 40 * sin(((float)frameCount / selectedFrameRate) * (2 * PI) / 2 + count * (2*PI/totalCount));
      newCube(xPosition, yPosition, angle , z);
      count++;
    }    
  }

}

void newCube(int xPosition, int yPosition, float angle, float z){
  pushMatrix();
  translate(xPosition, yPosition, z);
  rotateY(1.25 + angle);
  rotateX(-0.4 + 0.2 * angle);
  noStroke();
  fill(220,40,40,255);
  sphere(10);
  fill(220,40,40,120);
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