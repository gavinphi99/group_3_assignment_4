class EllipseCell {
  
  float radius;
  float maxRadius;
  float speed; //TODO: will be changed to PVector later
  color cellColor;
  Nucleus nucleus;
    
  //might not use these
  float x;
  float y;
  
  EllipseCell(float startX, float startY, float r, float maxR, float startSpeed, color c, Nucleus n){
    //set all fields' starting values based on parameters
    x = startX; y = startY; radius = r; maxRadius = maxR; speed = startSpeed; cellColor = c; nucleus = n;
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
