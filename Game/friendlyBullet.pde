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
  
  boolean check(){
    if(Math.abs(x - monster.x) < 10 && Math.abs(y - monster.y) < 10){
      return true;
    }
    else return (getX() <= 0 || getX() >= width || getY() <= 0 || getY() >= height);
  }
}