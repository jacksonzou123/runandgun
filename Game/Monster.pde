abstract class Monster extends Character{
  Monster(float x, float y, int maxhealth) {
    super(x,y,maxhealth);
  }
  
    float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
}

//MELEE MONSTER CODE
class Melee extends Monster{
  
  int s;
  
  Melee(float x, float y, int maxhealth) {
    super(x,y, maxhealth);
    s = millis();
  }
  
  
  void display() {
    s++;
    pushMatrix();
    translate(x,y);
    rotate(atan2(player.y - this.y, player.x - this.x));
    fill(100,100,0);
    ellipse(0,0,10,10);
    rectMode(CORNER);
    rect(0,4,10,0.5);
    rect(0,-5,10,0.5);
    popMatrix();
    fill(255,0,0);
    rect(x - 6, y - 10, 12, 2);
    fill(0,255,0);
    rect(x - 6, y - 10, (float)health/maxhealth * 12, 2);
  }
  
  void move(int i) {
    float scale = 2 * sqrt(pow((player.y-this.y),2)+pow((player.x-this.x),2));
    x+= (player.x-this.x)/scale;
    y+= (player.y-this.y)/scale;
  }
  
  void shoot(){
    if(millis() - s  >= 1500){
      s = millis();    
      float a = (random(100)-50)/100;
      enemyBullets.add(new enemyBullet(x,y,6.2831-(-1*atan2(player.y-y,player.x-x))+a, 5
      , color(0,122,0)));
    }
  }
  
  //helper method for monster deletion 
  boolean check() {
    if (health <= 0) {
       return true;
    }
    return false;
  }
}

//CODE FOR MISSILE CLASS
class Missile extends Melee{
  boolean exploded;
  Missile(float x,float y){
    super(x,y,1); //dies in 1 hit 
    exploded = false;
  }
  
  void display(){//It's an equilateral triangle
    pushMatrix();
    translate(x,y);
    rotate(3.14159-0.523599 +atan2(player.y - this.y, player.x - this.x));
    fill(153,0,0);
    triangle(-10,0,10,0,0,10*(float)Math.sqrt(3));
    popMatrix();
  }
  
  void move(int i){//follows the player and moves much faster than regular enemies
    float scale = 2 * sqrt(pow((player.y-this.y),2)+pow((player.x-this.x),2));
    x+= 8*((player.x-this.x)/scale);
    y+= 8*((player.y-this.y)/scale);
  }
  
    void shoot(){
    if(Math.abs(player.x -x)<10 && Math.abs(player.y -y) <10){
      player.health -= 30; //does big damage 
      exploded = true; //does some kamikaze action
    }
  }
  
    boolean check() { //if it's shot or explodes it is removed from the arraylist 
    if (health <= 0) {
       return true;
    }
    if(exploded) return true;
    return false;
  }
  
}
