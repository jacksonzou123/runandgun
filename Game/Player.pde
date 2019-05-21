class Player extends Character {
  Player(float x, float y) {
    super(x, y);
  }

  void display() {
    fill(0, 0, 255);
    pushMatrix();
    translate(x, y);
    float rotate;
    if (mouseX == x && mouseY > y) {
      rotate = 180;
    }
    else if (mouseX == x && mouseY < y) {
      rotate = 0;
    }
    else if (mouseY == y && mouseX > x) {
      rotate = 270;
    }
    else if (mouseY == y && mouseX < x) {
      rotate = 90;
    }
    else {
      rotate = atan((mouseY-y)/(mouseX-x));
    }
    rotate(rotate);
    ellipse(0,0,20,20);
    rect(0,-5,5,5);
    popMatrix();
  }

  void move(int num) {
    if (num == 0) {
      x-=5;
    }
    if (num == 1) {
      x+=5;
    }
    if (num == 2) {
      y-=5;
    }
    if (num == 3) {
      y+=5;
    }
  }
}
