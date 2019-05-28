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
