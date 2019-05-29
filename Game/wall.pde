abstract class wall{
  float x;
  float y;
  
  wall(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  abstract void display();
}

//PERMWALL CODE
class permWall extends wall{
  
  permWall(float x,float y){
    super(x,y);
  }
  
  void display(){
    rectMode(CENTER);
    fill(0,206,209);
    rect(x,y,20,20);
  }
}