class Player extends Character {
  boolean w;
  boolean a;
  boolean s;
  boolean d;
  
  Player(float x, float y) {
    super(x, y);
    w = false;
    a = false;
    s = false;
    d = false;
  }

  void display() {
    if(a) x-= 4;
    if(d) x+= 4;
    if(w) y-= 4;
    if(s) y+= 4;
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
    if (num == 0) { //a
      a = true;
    }
    if (num == 1) { //d
      d = true;
    }
    if (num == 2) { //w
      w = true;
    }
    if (num == 3) { //s
      s = true;
    }
  }
  
  void unmove(int num){
    if (num == 0) { //a
      a = false;
    }
    if (num == 1) { //d
      d = false;
    }
    if (num == 2) { //w
      w = false;
    }
    if (num == 3) { //s
      s = false;
    }
}
}