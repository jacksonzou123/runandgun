abstract class spawn{ //MONSTER SPAWNER 
 float x,y;
 int starttime;
 int interval;
 
 spawn(int time, float x, float y, int interval) {
  starttime = time; 
  this.x = x;
  this.y = y;
  this.interval = interval;
 }
 
 boolean check(int time) {
   if (time - starttime >= interval) {
     starttime = time;
     return true;
   }
   return false;
 }
 
 abstract void display();
 
 abstract void create();
}

//MONSTER SPAWNING CODE
class monsterspawn extends spawn{
  monsterspawn(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  void create() {
    monsters.add(new Melee(x,y,100));
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(x,y,20,20);
    fill(0);
    rect(x,y,15,15);
  }
}
