class Flagella {
  //global variables initialization
  float x, y, initY;
  float wid; 
  float freq; 
  float amplitude; 
  float speed; 
  int count = 0;
  color c;
  boolean flipFlagella;

  //constructor
  Flagella(float _x, float _y, float w, float _speed, color _c) {

    x = _x;
    y = _y;
    wid = w;
    freq = generateOddNumber(2, 10) * PI / wid;
    amplitude = wid / generateOddNumber(10, 15);
    speed = _speed;
    c = _c;
    flipFlagella = true;
    initY = y;
    count = 0;
  }

  //creates odd number less than or equal to biggest
  int generateOddNumber(int smallest, int biggest) {
    int oddNumber = 0;
    while (oddNumber % 2 != 1) {
      oddNumber = int(random(smallest, biggest));
    }
    return oddNumber;
  }

  void flipFlagella(float threshold) {
    count += speed;
    if (count >= threshold) {
      flipFlagella = !flipFlagella;
      count = 0;
    }
  }

  void display() {
    drawFlagella();
  }

  void drawFlagella() {
    
    float angle;
    float tempX = x;
    stroke(c);
    strokeWeight(4);
    noFill();

    if (flipFlagella) {
      beginShape();
      for (; tempX <= wid; tempX++) {
        angle = tempX * freq;
        y = initY + sin(angle) * amplitude;
        vertex(tempX, y);
      }
      endShape();
    } else {
      pushMatrix();
      scale(-1);
      translate(-wid, 0);
      beginShape();
      for (; tempX <= wid; tempX++) {
        angle = tempX * freq;
        y = initY + sin(angle) * amplitude;
        vertex(tempX, y);
      }
      endShape();
      popMatrix();
    }
    flipFlagella(144);
  }
}
