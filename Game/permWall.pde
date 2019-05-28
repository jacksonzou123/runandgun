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