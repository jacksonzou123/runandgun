Thing thing;

void setup() {
  size(800,1000);
  background(255);
  thing = new Thing(400,500);
}

void draw() {
  background(255);
  thing.display();
}

void keyPressed() {
  if (keyCode == 65) {
    thing.move(0);
  }
  if (keyCode == 87) {
    thing.move(2);
  }
  if (keyCode == 83) {
    thing.move(3);
  }
  if (keyCode == 68) {
    thing.move(1);
  }
}

class Thing{
  float x,y;
  
  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    fill(255);
    ellipse(x,y,20,20);
  }
  
  void move(int num) {
    if (num == 0) {
      x-=2.5;
    }
    if (num == 1) {
      x+=2.5;
    }
    if (num == 2) {
      y-=2.5;
    }
    if (num == 3) {
      y+=2.5;
    }
  }
}