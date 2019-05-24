class permWall extends wall{
  
  permWall(float x,float y){
    super(x,y);
  }
  
  void display(){
    rectMode(CENTER);
    fill(0);
    rect(x,y,10,10);
  }
}