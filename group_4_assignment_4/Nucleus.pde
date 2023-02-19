
class Nucleus {
  //definable fields
  float radius;
  //PVector speed;
  float x;
  float y;
  
  
  //rotation
  float currAngle;
  float rotSpeed = 0.1;
  
  //non-definable fields
  color standardColor = color(131,22,16);
  
  //constructor
  Nucleus(float startX, float startY, float r){ //TODO: will have speed added later
    x = startX; y = startY; radius = r;
  }
  
  //draws the nucleus onscreen, called by the cell class
  void display(){
    
    //rotation
    pushMatrix();
    rotation();

    //draw properties
    //ellipseMode(RADIUS);
    rectMode(CENTER);
    fill(standardColor);
    noStroke();
    
    rect(0,0,radius,radius);
    
    popMatrix();
  }
  
  void rotation(){
    currAngle += rotSpeed;
    
    rotate(currAngle);
  }
}
