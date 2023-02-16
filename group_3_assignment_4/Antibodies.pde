class Antibodies extends Spikes {
  float angle;

  
  Antibodies(PVector pos, float r, PVector vel, color c, float l, float w, int n) {
    super(pos, r, vel, c, l, w, n);
  }
  
  void display() {
    float angleIncrement = TWO_PI / n;
    
    for (int i = 0; i < n; i++) {
      //angle = map(i, 0, n, 0, TWO_PI);
      //angle += frameCount * 0.02; // Rotate triangles over time
      // Calculate position of rectangle
      float new_x = pos.x + cos(angle + i * TWO_PI/n) * r;
      float new_y = pos.y + sin(angle + i * TWO_PI/n) * r;
      //float rectAngle = atan2(pos.y - rectY, pos.x - rectX);
      float rotation = angle - PI;
        

      // Draw rotated rectangle
      pushMatrix();
      translate(new_x, new_y);
      rotate(rotation);
      // Draw equilateral triangle inside rectangle
      triangle(w/2, l + 10, w + 10, l, w - 10, l);
      popMatrix();

      angle += angleIncrement;
    }
  }
  
  void rotate_tri() {
    angle += 0.03;
  }
  
  
}
  
