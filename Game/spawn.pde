abstract class spawn{
 float x,y;
 int starttime;
 
 spawn(int time, float x, float y) {
  starttime = time; 
  this.x = x;
  this.y = y;
 }
 
 boolean check(int time) {
   if (time - starttime >= 1000) {
     starttime = time;
     return true;
   }
   return false;
 }
 
 abstract void create();
}