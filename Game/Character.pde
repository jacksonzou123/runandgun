abstract class Character{
  int health;
  float x,y;
  
  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  abstract void display();
  
  abstract void move(int num);
  
<<<<<<< HEAD
   boolean wallCheck(){
  for(int i = 0; i < walls.size(); i++){
    if(Math.abs(walls.get(i).getX() - x) > 10 && Math.abs(walls.get(i).getY() - y) > 10) return false;
  }
  return true;
 }
  
}
=======
  void changeHealth(int num) {
    health+=num;
  }
  
}
>>>>>>> dde2e3f9967446e74e7533e7dc1a9597fc331bbe
