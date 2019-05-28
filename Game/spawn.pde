abstract class spawn{
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
