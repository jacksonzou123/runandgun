class healspawn extends pspawn{
  
  healspawn(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  void create() {
    full = true;
  }
  
  void display() {
    rectMode(CENTER);
    fill(0,255,0);
    rect(x,y,20,20);
    fill(255);
    rect(x,y,15,15);
    if (full) {
      fill(0,255,0);
      rect(x,y,10,2);
      rect(x,y,2,10);
    }
  }
}
