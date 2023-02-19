class RectCell extends Cell {

  float maxHeight, maxWidth, rotation;
  boolean hasFlagella, hasNucleus;

  RectCell(float startX, float startY, float startSpeed, color c, Nucleus n, float w,
  float h, float _rotation, boolean _hasFlagella, boolean _hasNucleus) {
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c, n);
    maxWidth = w;
    maxHeight = h;
    hasFlagella = _hasFlagella;
    hasNucleus = _hasNucleus;
    rotation = _rotation;

  }

  //draws the cell onscreen
  void display() {
    pushMatrix();
    rotate(rotation);
    //nucleus.display();
    //draw itself
    rectMode(CENTER);
    stroke(1);
    fill(cellColor);
    rect(x, y, maxWidth, maxHeight);
    popMatrix();
  }

  void move() {
    pushMatrix();
    translate(x, y);
    y = y + speed;
    if (y < -height || y >= height * 2) {
      y = 0;
    }
    popMatrix();
  }
}
