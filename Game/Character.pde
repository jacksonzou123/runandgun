abstract class Character{
  int health;
  float x,y;
  
  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  abstract void display();
  
  abstract void move(int num);
  
   boolean wallCheck(){
  for(int i = 0; i < walls.size(); i++){
    if(Math.abs(walls.get(i).getX() - x) > 10 && Math.abs(walls.get(i).getY() - y) > 10) return false;
  }
  return true;
 }
  
  void changeHealth(int num) {
    health+=num;
  }
  
}