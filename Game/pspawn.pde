abstract class pspawn extends spawn{
  boolean full;
  
  pspawn(int time, float x, float y, int interval) {
    super(time, x, y, interval);
  }
  
  boolean check(int time) {
    if (time - starttime >= interval) {
     starttime = time;
     full = true;
    }
    if (full && abs(player.x - x) < 10 && abs(player.y - y) < 10) {
      full = false;
      return true;
    }
    return false;
  }
  
}
