class Nucleus {
  //definable fields
  float radius;
  PVector speed;
  float x;
  float y;

  //non-definable fields
  color standardColor = color(131, 22, 16);

  //constructor
  Nucleus(float startX, float startY, float r) { //TODO: will have speed added later
    x = startX; 
    y = startY; 
    radius = r;
  }

  //draws the nucleus onscreen, called by the cell class
  void display() {
    ellipseMode(RADIUS);
    fill(standardColor);
    noStroke();

    ellipse(x, y, radius, radius);

    ellipseMode(CENTER);
  }
}
