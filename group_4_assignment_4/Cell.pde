class Cell {
  
  float radius;
  float maxRadius;
  float speed; //TODO: will be changed to PVector later
  color cellColor;
    
  //might not use these
  float x;
  float y;
  
  Cell(float startX, float startY, float startSpeed, color c) {
    //set all fields' starting values based on parameters
    x = startX; 
    y = startY; 
    speed = startSpeed; 
    cellColor = c;
  }
}
