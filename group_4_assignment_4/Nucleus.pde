
class Nucleus {
  //definable fields
  float wid;
  //PVector speed;
  float x;
  float y;
  
  
  //rotation
  float currAngle;
  float rotSpeed = 0.1;
  
  //non-definable fields
  color standardColor = color(131,22,16);
  
  //constructor
  Nucleus(float w){ //TODO: will have speed added later
    wid = w;
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
    
    rect(0,0,wid,wid);
    
    popMatrix();
  }
  
  void rotation(){
    currAngle += rotSpeed;
    
    rotate(currAngle);
  }
}
