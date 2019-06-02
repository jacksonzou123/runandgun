//and so it begins
abstract class Boss{
  int health, maxhealth;
  int m; 
  int timer;
  float x, y;
  float angle;
  
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
    maxhealth = 100000;
    health = maxhealth;
  }
  
  void display() {
    rectMode(CENTER);
    pushMatrix();
    translate(x,y);
    rotate(angle);
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
    fill(0,120,120);
    rect(-140,135,20,30);
    rect(-70,135,20,30);
    rect(70,135,20,30);
    rect(140,135,20,30);
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
    //if (millis() - timer < 1500) {
    //  angle = angle + 0.01;
    //}
    //else if (millis() - timer > 1500 && millis() - timer < 3000) {
    //  angle = angle - 0.02;
    //}
    //else if (millis() - timer > 3000 && millis() - timer < 4500) {
    //  angle = angle + 0.02;
    //}
    //else if (millis() - timer > 4500 && millis() - timer < 6000) {
    //  angle = angle - 0.01;
    //}
    if (millis() - timer > 0 && millis() - timer < 3000) {
      y+=1;
    }
    else {
      mode = "stage";
    }
    
  }
  
}
