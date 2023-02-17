class Antibodies extends Spikes {
  float angle;
  float new_angle;
  
  Antibodies(PVector pos, float r, PVector vel, color c, float l, float w, int n, float angle) {
    super(pos, r, vel, c, l, w, n);
    this.angle = angle;
  }
  
  void display() {
    
    for (int i = 0; i < n; i++) {
      //angle = map(i, 0, n, 0, TWO_PI);
      //angle += frameCount * 0.02; // Rotate triangles over time
      
      float new_x = pos.x + cos(new_angle + i * TWO_PI/n) * r;
      float new_y = pos.y + sin(new_angle + i * TWO_PI/n) * r;
      //float rectAngle = atan2(pos.y - rectY, pos.x - rectX);s
      float rotation = atan2(pos.y - new_y, pos.x - new_x);

      // Draw rotated rectangle
      pushMatrix();
      translate(new_x, new_y);
      rotate(rotation);
      
      // Draw equilateral triangle inside rectangle
      triangle(w/2, l + 10, w + 10, l, w - 10, l);
      popMatrix();
    }
  }
  void rotate_tri() {
    new_angle += angle;
  }
  
  
}
  
