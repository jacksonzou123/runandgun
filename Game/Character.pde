abstract class Character{
  int health;
  int maxhealth;
  float x,y;
  
  Character(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Character(float x, float y, int maxhealth) {
   this.x = x;
   this.y = y;
   this.maxhealth = maxhealth;
   health = maxhealth;
  }
  
  abstract void display();
  
  abstract void move(int num);
  
  
  //to modify health for health pickups / damage from enemy bullets 
  void changeHealth(int num) {
    health+=num;
    if (health > maxhealth) {
      health = maxhealth;
    }
  }
  
}
