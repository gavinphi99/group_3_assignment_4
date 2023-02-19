class RectCell extends Cell {

  float maxHeight, maxWidth, rotation;
  boolean hasFlagella, hasNucleus;
  Flagella flagella;

  RectCell(float startX, float startY, float startSpeed, color c, float w, 
    float h, float _rotation, boolean _hasFlagella) {
    //set all fields' starting values based on parameters
    super(startX, startY, startSpeed, c);
    maxWidth = w;
    maxHeight = h;
    hasFlagella = _hasFlagella;
    rotation = _rotation;
    flagella = new Flagella(startX, startY, startSpeed, h, rotation, c);

  }

  //draws the cell onscreen
  void display() {
    drawRectCell();
  }

  void drawRectCell() {
    pushMatrix();
    rotate(rotation);
    translate(x, y);
    //nucleus.display();
    //draw itself
    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    fill(cellColor);
    rect(0, 0, maxWidth, maxHeight);
    if(hasFlagella){
      drawFlagella();
    }
    popMatrix();
  }

  void move() {
    y = y + speed;
    if (y < 0 || y >= height * sqrt(3)) {
      y = 0;
    }
  }

  void drawFlagella() {
    pushMatrix();
    translate(0, -maxHeight / 2);
    rotate(rotation);
    flagella.display();
    popMatrix();
  }
}
