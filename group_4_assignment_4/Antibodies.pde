class Antibodies extends Spikes {
  float angle;
  float new_angle;
  
  Antibodies(PVector pos, float r, PVector vel, color c, float l, float w, int n, float angle) {
    super(pos, r, vel, c, l, w, n);
    this.angle = angle;
  }
  
  void display() {
    
    for (int i = 0; i < n; i++) {
      
      float new_x = pos.x + cos(new_angle + i * TWO_PI/n) * r;
      float new_y = pos.y + sin(new_angle + i * TWO_PI/n) * r;
      float rotation = atan2(pos.y - new_y, pos.x - new_x);


      pushMatrix();
      translate(new_x, new_y);
      rotate(rotation);
      triangle(w/2, l + 10, w + 10, l, w - 10, l);
      popMatrix();
    }
  }
  
  void rotate_tri() {
    new_angle += angle;
  }
  
}
  
