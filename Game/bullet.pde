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


//ENEMY BULLET CODE
class enemyBullet extends bullet{
  
  public enemyBullet(float x,float y,float heading){
    super(x,y,heading,1);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void move(){
    x+=5*cos(heading);
    y+=5*sin(heading);
  }
  
  void display(){
    fill(255,0,0);
    ellipse(x,y,10,10);
  }
  
  boolean check(){
    if(Math.abs(x - player.x) < 10 && Math.abs(y - player.y) < 10){
      player.changeHealth(-1);
      return true;
    }
    for(int i = 0;i<walls.size();i++){
      if(Math.abs(x - walls.get(i).getX()) < 10 && Math.abs(y - walls.get(i).getY()) < 10){
        return true;
      }
    }
    return (getX() <= 0 || getX() >= width || getY() <= 0 || getY() >= height-75);
  }
}


//FRIENDLY BULLET CODE
class friendlyBullet extends bullet{
  
  public friendlyBullet(float x,float y,float heading){
    super(x,y,heading,1);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void move(){
    x+=8*cos(heading);
    y+=8*sin(heading);
  }
  
  void display(){
    fill(0,255,0);
    ellipse(x,y,10,10);
  }
  
  boolean check(Monster monster){
    if(Math.abs(x - monster.x) < 10 && Math.abs(y - monster.y) < 10){
      return true;
    }
    return false;
  }
  
  boolean check() {
     for(int i = 0;i<walls.size();i++){
      if(Math.abs(x - walls.get(i).getX()) < 10 && Math.abs(y - walls.get(i).getY()) < 10){
        return true;
      }
    }
    for(int i = 0; i < monsters.size(); i++){
      if(Math.abs(x - monsters.get(i).getX()) < 10 && Math.abs(y - monsters.get(i).getY()) < 10){
        monsters.remove(i);
        i--;
        return true;
      }
    }
    return (getX() <= 0 || getX() >= width || getY() <= 0 || getY() >= height-75);
  }
}