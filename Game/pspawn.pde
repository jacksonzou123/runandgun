abstract class pspawn extends spawn{//ITEM SPAWNERS 
  boolean full;
  
  pspawn(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  boolean check(int time) {
    if (!full && time - starttime >= interval) {
     starttime = time;
     full = true;
    }
    if (full && abs(player.x - x) < 10 && abs(player.y - y) < 10) {
      full = false;
      starttime = millis();
      return true;
    }
    return false;
  }
  
  abstract void give();
  
}


//SPAWNS HEAL PACKS
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
  
  void give() {
    player.changeHealth(50);
  }
}

class shotgunpack extends pspawn{
  
  shotgunpack(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  void create() {
    full = true;
  }
  
  void display() {
    fill(255,0,0);
    ellipse(x,y,20,20);
    if (full) {
      fill(255);
      ellipse(x,y,10,10);
    }
  }
  
  void give() {
    player.addAmmo(1,10);
  }
}

class assaultpack extends pspawn{
  
  assaultpack(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  void create() {
    full = true;
  }
  
  void display() {
    fill(30,100,140);
    ellipse(x,y,20,20);
    if (full) {
      fill(255);
      ellipse(x,y,10,10);
    }
  }
  
  void give() {
    player.addAmmo(2,75);
  }
}
