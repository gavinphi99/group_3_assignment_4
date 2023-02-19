//viruses declaration
ArrayList<Virus> viruses;
ArrayList<Spikes> spikes;
ArrayList<Antibodies> antibodies;
//ellipse cells declaration
color cellColor1 = color(98, 237, 162, 150);
color cellColor2 = color(195,237,98, 150);
color cellColor3 = color(98, 138, 237, 150);
EllipseCell ellipseCell1;
EllipseCell ellipseCell2;
EllipseCell ellipseCell3;
//rect cells declaration
RectCell firstRectCell, secondRectCell;


void setup() {
  size(500, 500);
  rectMode(CENTER);

  setupViruses(10);
  
  setupEllipseCells();
  
  setupRectCells();

}

void draw() {
  background(255);
  drawViruses();
  drawEllipseCells();
  drawRectCells();
}


void setupViruses(int numViruses) {
  //VIRUSES
  viruses = new ArrayList<Virus>();
  spikes = new ArrayList<Spikes>();
  antibodies = new ArrayList<Antibodies>();

  for (int i = 0; i < numViruses; i++) {
    // generate a random starting position and velocity for each circle
    float x0 = random(width);
    float y0 = random(height);
    PVector pos = new PVector(x0, y0);
    float r = random(5, 10);
    float vx0 = random(-1.25, 1.25);
    float vy0 = random(-1.25, 1.25);
    PVector vbar = new PVector(vx0, vy0);
    color c = color(random(255), random(255), random(255));


    float w = random(3, 4.5);
    int n = (int)random(5, 8);
    float l = r/n + random(10, 20);

    float angle = random(0.01, 0.05);

    viruses.add(new Virus(pos, r, vbar, c)); 
    spikes.add(new Spikes(pos, r, vbar, c, l, w, n));
    antibodies.add(new Antibodies(pos, r, vbar, c, l, w, n, angle));
  }
}

void drawViruses() {
  //draw viruses
  for (int j = 0; j < viruses.size(); j++) {
    viruses.get(j).move();
    viruses.get(j).display();
    spikes.get(j).move();
    spikes.get(j).display();
    antibodies.get(j).move();
    antibodies.get(j).rotate_tri();
    antibodies.get(j).display();
  }
}
void setupEllipseCells(){
  ellipseCell1 = new EllipseCell(150, 275, 30, 1.5, 0, cellColor1, new Nucleus(16), 0.005);
  ellipseCell2 = new EllipseCell(389, 400, 15, 1.4, 0, cellColor2, new Nucleus(8), 0.0025);
  ellipseCell3 = new EllipseCell(340, 100, 21, 1.3, 0, cellColor3, new Nucleus(20), 0.0025);
}

void drawEllipseCells() {
  //draw ellipse cells
  ellipseCell1.display();
  ellipseCell2.display();
  ellipseCell3.display();
}

void setupRectCells(){
  //RECT CELLS
  firstRectCell = new RectCell(0, 0, 2, color(#500000),  40, 133, 7 * PI / 4, true);
  secondRectCell = new RectCell(0, 0, 3, color(#bf5700),  30, 100, 7 * PI / 4 , true);
  
}

void drawRectCells() {
  //draw rect cells
  firstRectCell.display();
  firstRectCell.move();
  secondRectCell.display();
  secondRectCell.move();
}
