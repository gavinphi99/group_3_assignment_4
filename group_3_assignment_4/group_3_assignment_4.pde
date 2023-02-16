ArrayList<Virus> viruses;
ArrayList<Spikes> spikes;
ArrayList<Antibodies> antibodies;
int numViruses;

void setup() {
  size(500, 500);
  
  numViruses = 10;
  
  viruses = new ArrayList<Virus>();
  spikes = new ArrayList<Spikes>();
  antibodies = new ArrayList<Antibodies>();
  
  for (int i = 0; i < numViruses; i++) {
    // generate a random starting position and velocity for each circle
    float x0 = random(width);
    float y0 = random(height);
    PVector pos = new PVector(x0, y0);
    float r = random(15, 45);
    float vx0 = random(-1.5, 1.5);
    float vy0 = random(-1.5, 1.5);
    PVector vbar = new PVector(vx0, vy0);
    color c = color(random(255), random(255), random(255));
    
    
    float w = random(4.5, 6.25);
    int n = (int)random(5, 8);
    float l = r/n + random(20, 40);
    
    viruses.add(new Virus(pos, r, vbar, c)); 
    spikes.add(new Spikes(pos, r, vbar, c, l, w, n));
    antibodies.add(new Antibodies(pos, r, vbar, c, l, w, n));
    
    
  }
}

void draw() {
  background(255);
  for (int j = 0; j < numViruses; j++) {
    viruses.get(j).display();
    viruses.get(j).move();
    spikes.get(j).move();
    spikes.get(j).display();
    antibodies.get(j).move();
    //antibodies.get(j).rotate_tri();
    antibodies.get(j).display();
  }
}
