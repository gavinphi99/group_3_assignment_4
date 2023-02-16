class Spikes extends Virus {
  float l;
  float w;
  float n;
  
  Spikes(PVector pos, float r, PVector vel, color c, float l, float w, int n) {
    super(pos, r, vel, c);
    this.l = l;
    this.w = w;
    this.n = n;
  }
  
  

  
  void display() {
    rectMode(CENTER);
    float angle = 0;
    float angleIncrement = TWO_PI / n;
    for (int i = 0; i < n; i++) {
    

      // Calculate position of rectangle
      float rectX = pos.x + cos(angle) * r;
      float rectY = pos.y + sin(angle) * r;
      float rectAngle = atan2(pos.y - rectY, pos.x - rectX);
      

      // Draw rotated rectangle
      pushMatrix();
      translate(rectX, rectY);
      rotate(rectAngle);
      rect(0, 0, l, r/w);
      // Draw equilateral triangle inside rectangle
      popMatrix();

      angle += angleIncrement;
    }
  }
  
}
