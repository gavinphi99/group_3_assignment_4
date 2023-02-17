//viruses declaration
ArrayList<Virus> viruses;
ArrayList<Spikes> spikes;
ArrayList<Antibodies> antibodies;
int numViruses;
//ellipse cells declaration
EllipseCell testCell;
Nucleus testNucleus;
color cellColor1 = color(185,228,255,150);

void setup() {
  size(500, 500);
  rectMode(CENTER);
  
  numViruses = 10;
  
  //VIRUSES
  viruses = new ArrayList<Virus>();
  spikes = new ArrayList<Spikes>();
  antibodies = new ArrayList<Antibodies>();
  
  //ELLIPSE CELLS
  testNucleus = new Nucleus(250, 250, 8);
  testCell = new EllipseCell(250,250,30,100,0,cellColor1,testNucleus);
  
  for (int i = 0; i < numViruses; i++) {
    // generate a random starting position and velocity for each circle
    float x0 = random(width);
    float y0 = random(height);
    PVector pos = new PVector(x0, y0);
    float r = random(15, 45);
    float vx0 = random(-1.25, 1.25);
    float vy0 = random(-1.25, 1.25);
    PVector vbar = new PVector(vx0, vy0);
    color c = color(random(255), random(255), random(255));
    
    
    float w = random(4.5, 6.25);
    int n = (int)random(5, 8);
    float l = r/n + random(20, 40);
    
    float angle = random(0.01, 0.05);
    
    viruses.add(new Virus(pos, r, vbar, c)); 
    spikes.add(new Spikes(pos, r, vbar, c, l, w, n));
    antibodies.add(new Antibodies(pos, r, vbar, c, l, w, n, angle));
    
  }
}

void draw() {
  background(255);
  
  //draw viruses
  for (int j = 0; j < numViruses; j++) {
    viruses.get(j).move();
    viruses.get(j).display();
    spikes.get(j).move();
    spikes.get(j).display();
    antibodies.get(j).move();
    antibodies.get(j).rotate_tri();
    antibodies.get(j).display();
  }
  
  //draw ellipse cells
  testCell.display();
}
