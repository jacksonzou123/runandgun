class Player extends Character{
  Player(float x, float y) {
    super(x,y);
  }
  
  void display() {
    fill(0,0,255);
    tri(x,y,30,0);
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