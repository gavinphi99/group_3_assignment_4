class EllipseCell extends Cell {
  
  float radius;
  
<<<<<<< HEAD
  EllipseCell(float startX, float startY, float r, float maxR, float startSpeed, color c, Nucleus n) {
=======
  //scale
  float minScale = 1;
  float maxScale;
  
  float sizeChangeRate = 0.01;
  float currScale;
  boolean increasing;
  
  PShape body;
  
  EllipseCell(float startX, float startY, float r, float maxS, float startSpeed, color c, Nucleus n){
>>>>>>> 021450711575169c8200148e43f9552eb54db28d
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c, n);
    radius = r;
    maxScale = maxS;
    currScale = 1.1;
    increasing = true;
    
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
      currScale += sizeChangeRate;
    }
    else {
      currScale -= sizeChangeRate;
    }
    
    scale(currScale);
  }
}
