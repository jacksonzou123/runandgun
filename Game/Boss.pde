//and so it begins
abstract class Boss{
  int health;
  int mode; 
  int timer;
  float x, y;
  
  Boss(float x, float y) {
    this.x = x;
    this.y = y;
    timer = millis();
  }
  
  void changeHealth(int health) {
    this.health += health; 
  }
  
  abstract void display();
  
  abstract void attack();
  
  abstract void entrance();
}

class BossUno extends Boss{
  BossUno(float x, float y) {
    super(x,y);
  }
  
  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(x,y);
    //main body
    fill(#f95001);
    rect(0,0,400,300);
    
    //head
    fill(0);
    ellipse(0,120,100,100);
    
    //left arm
    fill(#f95001);
    rectMode(CENTER);
    rect(-250,100,100,10);
    rectMode(CORNER);
    rect(-310,95,10,100);
    rectMode(CENTER);
    rect(-305,220,50,50);
    //right arm
    fill(#f95001);
    rectMode(CENTER);
    rect(250,100,100,10);
    rectMode(CORNER);
    rect(310,95,-10,100);
    rectMode(CENTER);
    rect(305,220,50,50);
    popMatrix();
  }
  
  void attack() {
    
  }
  
  void entrance() {
    
  }
  
}
