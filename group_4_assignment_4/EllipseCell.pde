class EllipseCell extends Cell{
  
  float radius;
  float maxRadius;
  
  EllipseCell(float startX, float startY, float r, float maxR, float startSpeed, color c, Nucleus n){
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c, n);
    radius = r; 
    maxRadius = maxR;
  }
  
  //draws the cell onscreen
  void display() {
    //draw the nucleus first so it appears under (visible through transparency)
    nucleus.display();
    
    //draw itself
    ellipseMode(RADIUS);
    noStroke();
    fill(cellColor);
    ellipse(x, y, radius, radius);
    ellipseMode(CENTER);
  }
}
