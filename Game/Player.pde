class Player extends Character {
  boolean w;
  boolean a;
  boolean s;
  boolean d;
  int fireMode;
  
  Player(float x, float y) {
    super(x, y);
    w = false;
    a = false;
    s = false;
    d = false;
    fireMode = 0;
  }

  void display() {
    if(a && !(x<15)) x-= 4;
    if(d && !(x>985)) x+= 4;
    if(w && !(y<15)) y-= 4;
    if(s && !(y>685)) y+= 4;
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
  
 void changeFireMode(){
   if(fireMode >= 2) fireMode = 0;
   else fireMode++;
 }
}
