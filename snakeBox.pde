

// segment points
float[] x = new float[50];
float[] y = new float[50];
float segLength = 15;
int hide = 30;
boolean state;
PVector boxPos = new PVector(random(width/2), height/2);
PVector boxPos2 = new PVector(500, height/2);

ArrayList<Box> myBox = new ArrayList<Box> ();

float hit;

//time slicer
float t = 0.0;
float tStep = 0.004;

int borderSize = 40;

////////// SETUP
void setup() {
  size(1024, 768, P2D);
  frameRate(60);
  strokeWeight(1);
  //myBox = new Box(boxPos, 25);
  return;
}


void draw() {

  background(0);

  // draw segment line follower
  pushMatrix();
  {
    strokeWeight(1);
    stroke(255, 100);
    dragSegment(0, mouseX, mouseY);
    for (int i=0; i<x.length-hide; i++) {
      dragSegment(i+1, x[i], y[i]);
    }
    myBox.add(new Box(boxPos, 25));
  }

  popMatrix();
  for (int i = 0; i < myBox.size(); i++) {
    Box group = myBox.get(i);
    group.display();
    group.update();
    hit = dist(mouseX, mouseY, group.pos.x + group.size/2, group.pos.y + group.size/2);

    return;
  }
}

  void dragSegment(int i, float xin, float yin) {
    float dx = xin - x[i];
    float dy = yin - y[i];
    float angle = atan2(dy, dx);  
    x[i] = xin - cos(angle) * segLength;
    y[i] = yin - sin(angle) * segLength;
    segment(x[i], y[i], angle);
  }


  void segment(float x, float y, float a) {
    pushMatrix();
    {
      translate(x, y);
      rotate(a);
      line(0, 0, segLength, 0);
    }
    popMatrix();
  }