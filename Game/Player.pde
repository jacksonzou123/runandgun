class Player extends Character {
  Player(float x, float y) {
    super(x, y);
  }

  void display() {
    fill(0, 0, 255);
    pushMatrix();
    translate(x, y);
    rotate(atan2((mouseY-y),(mouseX-x)));
    ellipse(0,0,20,20);
    fill(255,0,0);
    rect(5,0,20,1);
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