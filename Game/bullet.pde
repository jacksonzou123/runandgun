abstract class bullet{
  int damage;
  float x;
  float y;
  float heading;
  
  public bullet(){
  }
  
  public bullet(float x,float y,float heading,int damage){
    this.x = x;
    this.y = y;
    this.heading = heading;
    this.damage = damage;
  }
  
  abstract void move();
  abstract void display();
}