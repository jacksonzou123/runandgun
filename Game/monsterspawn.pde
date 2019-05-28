class monsterspawn extends spawn{
  monsterspawn(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  void create() {
    monsters.add(new Melee(x,y));
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(x,y,20,20);
    fill(0);
    rect(x,y,15,15);
  }
}
