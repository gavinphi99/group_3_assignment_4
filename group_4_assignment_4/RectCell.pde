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
    rotation = 0;
    flagella = new Flagella(startX, startY, startSpeed, 3 * maxWidth, c);
  }

  //draws the cell onscreen
  void display() {
    drawRectCell();
  }

  void drawRectCell() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    //nucleus.display();
    //draw itself
    rectMode(CENTER);
    stroke(0);
    strokeWeight(2);
    fill(cellColor);
    rect(0, 0, maxWidth, maxHeight);
    if(this.hasFlagella){
      drawFlagella();
    }
    popMatrix();
  }

  void move() {
    y = y + speed;
    if (y < -height || y >= height * 2) {
      y = 0;
    }
  }

  void drawFlagella() {
    pushMatrix();
    translate(0, maxHeight / 2);
    rotate(rotation);
    flagella.display();
    popMatrix();
  }
}
