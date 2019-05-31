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
  abstract void damage();
  
  boolean checkLeft(){//checks left side to see if player is too close 
    for(int i = 0; i < walls.size(); i++){
      if(player.x < x && x - player.x <= 20 && Math.abs(y - player.y)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkRight(){//checks right side if player is too close 
        for(int i = 0; i < walls.size(); i++){
      if(player.x > x && player.x - x <= 20 && Math.abs(y - player.y)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkUp(){//checks up to see if player is too close 
        for(int i = 0; i < walls.size(); i++){
      if(player.y < y && y - player.y  <= 20 && Math.abs(x - player.x)<20){
        return false;
      }
    }
    return true;
  }
  
  boolean checkDown(){//checks downward to see if player is too close 
        for(int i = 0; i < walls.size(); i++){
      if(player.y > y && player.y - y <= 20 && Math.abs(x - player.x)<20){
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
    fill(155);
    rect(x,y,20,20);
  }
  
  void damage(){
  }
}

class tempWall extends wall{
  int hits;
  tempWall(float x,float y){
    super(x,y);
    hits = 5;
  }
    void display(){
    rectMode(CENTER);
    fill(0,206,209);
    rect(x,y,20,20);
  }
  
  void damage(){
    if(hits<=0){
      x = -5;
      y = -5;
    }
    else hits--;
  }
  
}
