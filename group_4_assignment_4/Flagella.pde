class Flagella {
  //global variables initialization
  float x, y;
  float wid; float freq; float amplitude; float speed; color c;
  
  //constructor
  Flagella(float _x, float _y, float w, float _freq, float _amplitude, float _speed, color _c){
    
    x = _x;
    y = _y;
    wid = w;
    freq = _freq;
    amplitude = _amplitude;
    speed = _speed;
    c = _c;
  }
  
  void display() {
    float angle;
    float initY = y;
    stroke(c);
    noFill();
    beginShape();
    while(x <= wid) {
      angle = x * freq;
      y = initY + sin(angle) * amplitude;
      vertex(x, y);
      x++;
    }
    endShape();
  }
}
