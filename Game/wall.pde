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
  
  boolean checkLeft(){
    for(int i = 0; i < walls.size(); i++){
      if(x - player.x <= 20 && Math.abs(y - player.y)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkRight(){
        for(int i = 0; i < walls.size(); i++){
      if(player.x - x <= 20 && Math.abs(y - player.y)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkUp(){
        for(int i = 0; i < walls.size(); i++){
      if(y - player.y  <= 20 && Math.abs(x - player.x)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkDown(){
        for(int i = 0; i < walls.size(); i++){
      if(player.y - y <= 20 && Math.abs(x - player.x)<20){
        return false;
      }
    }
    return true;
  }
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