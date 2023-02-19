class EllipseCell extends Cell{
  
  float radius;
  
  //scale
  float minScale = 1;
  float maxScale;
  
  float sizeChangeRate = 0.01;
  float currScale;
  boolean increasing;
  
  PShape body;
  
  EllipseCell(float startX, float startY, float r, float maxS, float startSpeed, color c, Nucleus n){
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c, n);
    radius = r;
    maxScale = maxS;
    currScale = 1.1;
    increasing = true;
    
    ellipseMode(RADIUS);
    noStroke();
    fill(cellColor);
    body = createShape(ELLIPSE, x, y, radius, radius);
  }
  
  //draws the cell onscreen
  void display() {
    //draw the nucleus first so it appears under (visible through transparency)
    nucleus.display();
    
    pushMatrix();
    
  //draw itself
    //apply scale
    sizeChange();    
    //draw
    scale(currScale);
    ellipseMode(RADIUS);
    shape(body);
    
    popMatrix();
  }
  
  //change the size of the cell body
  void sizeChange(){
    
    if (increasing) {
      if (currScale < maxScale){
        increasing = true;      }
      else {
        increasing = false;
      }
    }
    else {
      if (currScale > minScale){
        increasing = false;
      }
      else {
        increasing = true;
      }
    }
    
    //
    if (increasing){
      currScale += sizeChangeRate;
    }
    else {
      currScale -= sizeChangeRate;
    }
    
    scale(currScale);
  }
}
