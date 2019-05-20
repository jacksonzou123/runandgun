abstract class Character{
  int health;
  float x,y;
  
  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  abstract void display();
  
  abstract void move(int num);
  
}