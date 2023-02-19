class EllipseCell extends Cell{
  
  float radius;
  
  //scale
  float minScale = 1;
  float maxScale;
  
  float scaleRate = 0.01;
  float currScale;
  boolean increasing;
  
  Nucleus nucleus;
  
  PShape body;
  
  EllipseCell(float startX, float startY, float r, float maxS, float startSpeed, color c, Nucleus n, float scaleSpeed){
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c);
    radius = r;
    maxScale = maxS;
    scaleRate = scaleSpeed;
    
    currScale = 1.1;
    increasing = true;
    
    nucleus = n;
    
    ellipseMode(RADIUS);
    noStroke();
    fill(cellColor);
    body = createShape(ELLIPSE, 0, 0, radius, radius);
  }
  
  //draws the cell onscreen
  void display() {
    //draw the nucleus first so it appears under (visible through transparency)
    
    pushMatrix();
    
  //draw self
    translate(x,y);

    sizeChange();   
    nucleus.display();

    sizeChange();    
    //draw
    //ellipseMode(RADIUS);
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
      currScale += scaleRate;
    }
    else {
      currScale -= scaleRate;
    }
    
    scale(currScale);
  }
}
