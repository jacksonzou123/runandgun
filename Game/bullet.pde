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
    this.heading = heading; //what angle direction it's facing (in radians)
    this.damage = damage;
  }
  
  abstract void move();
  abstract void display();
}


//ENEMY BULLET CODE
class enemyBullet extends bullet{
  
  public enemyBullet(float x,float y,float heading){
    super(x,y,heading,-20);
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
  
  //checks if it needs to be deleted 
  boolean check(){
    if(Math.abs(x - player.x) < 10 && Math.abs(y - player.y) < 10){//if it's hit the player 
      player.changeHealth(damage);
      return true;
    }
    for(int i = 0;i<walls.size();i++){//if it's hit a wall
      if(Math.abs(x - walls.get(i).getX()) < 10 && Math.abs(y - walls.get(i).getY()) < 10){
        walls.get(i).damage();
        return true;
      }
    }
    return (getX() <= 0 || getX() >= width || getY() <= 0 || getY() >= height-75); //if it's out of bounds 
  }
}


//FRIENDLY BULLET CODE
class friendlyBullet extends bullet{
  
  public friendlyBullet(float x,float y,float heading){
    super(x,y,heading,-20);
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
  

  boolean check() {//checks if it needs to be deleted 
     for(int i = 0;i<walls.size();i++){//if it's hit a wall
      if(Math.abs(x - walls.get(i).getX()) < 10 && Math.abs(y - walls.get(i).getY()) < 10){
        return true;
      }
    }
    for(int i = 0; i < monsters.size(); i++){//if it's hit a monster 
      if(Math.abs(x - monsters.get(i).getX()) < 10 && Math.abs(y - monsters.get(i).getY()) < 10){
        monsters.get(i).changeHealth(-20);
        return true;
      }
    }
    if (x < boss.x + 200 && x > boss.x - 200 && y < boss.y + 150 && y > boss.y - 150 ||
        x < boss.x - 200 && x > boss.x - 300 && y < boss.y + 105 && y > boss.y + 95 ||
        x < boss.x + 300 && x > boss.x + 200 && y < boss.y + 105 && y > boss.y + 95 ||
        x < boss.x - 300 && x > boss.x - 310 && y < boss.y + 195 && y > boss.y + 95 ||
        x < boss.x + 310 && x > boss.x + 300 && y < boss.y + 195 && y > boss.y + 95 ||
        x < boss.x - 280 && x > boss.x - 330 && y < boss.y + 245 && y > boss.y + 195 ||
        x < boss.x + 330 && x > boss.x + 280 && y < boss.y + 245 && y > boss.y + 195
      ) {
      boss.changeHealth(-20);
      return true;
    }
    return (getX() <= 0 || getX() >= width || getY() <= 0 || getY() >= height-75);//if it's out of bounds 
  }
}
