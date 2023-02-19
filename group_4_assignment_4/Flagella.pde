class Flagella {
  //global variables initialization
  float x, y, initY;
  float wid; 
  float freq; 
  float amplitude; 
  float speed; 
  int count = 0;
  color c;
  boolean flipDirection;
  float rotate;

  //constructor
  Flagella(float _x, float _y, float _speed, float w, float _rotate, color _c) {
    
    //gives position
    x = _x;
    y = _y;
    
    //how long the flagella is
    wid = w;
    
    //number of waves randomly generated (must be odd for transformations to work)
    freq = generateOddNumber(2, 7) * PI / wid;
    
    //height of wave peaks
    amplitude = wid / generateOddNumber(10, 15);
    
    //variable is based on speed of RectCell, also controls how fast the tail is transformed using 
    //  flipFlagella method
    speed = _speed;
    
    c = _c;
    flipDirection = true;
    
    initY = y;  //helps with tail production
    count = 0;  //controls timing of tail transformation to give illusion of flipping
    rotate = _rotate;  //rotation based on rectCell
  }

  //creates odd number less than or equal to biggest
  int generateOddNumber(int smallest, int biggest) {
    int oddNumber = 0;
    while (oddNumber % 2 != 1) {
      oddNumber = int(random(smallest, biggest));
    }
    return oddNumber;
  }
  
  //flips the flagella (using boolean) based on speed of the RectCell (gives illusion of faster/slower movement
  void flipFlagella(float threshold) {
    count += speed;
    if (count >= threshold) {
      flipDirection = !flipDirection;
      count = 0;
    }
  }
  
  //calls drawFlagella, method is here for any desired editing in the future
  void display() {
    drawFlagella();
  }
  
  //actual drawing and transforming of the flagella
  void drawFlagella() {
    float angle;
    float tempX = x;   //Variable used to change x to draw flagella without actually changing x val
    stroke(c);
    strokeWeight(wid / 30);
    noFill();
    
    //actual drawing of flagella transformed based on flipDirection (gives illusion of swimming)
    if (flipDirection) {
      pushMatrix();
      scale(-1);
      rotate(rotate);
      translate(-wid, 0);
      beginShape();
      for (; tempX <= wid; tempX++) {
        angle = tempX * freq;
        y = initY + sin(angle) * amplitude;
        vertex(tempX, y);
      }
      endShape();
      popMatrix();
    } else {
      pushMatrix();
      scale(-1);
      rotate(PI * 3 + rotate);
      beginShape();
      for (; tempX <= wid; tempX++) {
        angle = tempX * freq;
        y = initY + sin(angle) * amplitude;
        vertex(tempX, y);
      }
      endShape();
      popMatrix();
    }
    //call to flip the flagella boolean
    flipFlagella(12 * wid / amplitude);
  }
}
