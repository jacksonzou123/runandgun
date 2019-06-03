//and so it begins
abstract class Boss{
  int health, maxhealth;
  int m; 
  int timer;
  float x, y;
  float angle;
  boolean right;
  
  Boss(float x, float y) {
    this.x = x;
    this.y = y;
    timer = millis();
    right = true;
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
    maxhealth = 10000;
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
    if(t % 21 < 10) fill(255,255,255);
    else fill(255,0,0);
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
    if (((float)health)/maxhealth > 0.75 ) {
      m = 0;
    }
    if (((float)health)/maxhealth < 0.75 && ((float)health)/maxhealth > 0.5 ) {
      m = 1;
    }
    if (((float)health)/maxhealth < 0.5 && ((float)health)/maxhealth > 0.25 ) {
      m = 2;
    }
    if (((float)health)/maxhealth < 0.25) {
      m = 3;
    }
    if (m == 0 || m == 1) {
      if (millis() - timer > 500) {
        int num = (int)(7*Math.random());
        int a = 0;
        int b = 0;
        if (num == 0) {
          a = -70;
          b = 150;
        }
        if (num == 1) {
          a = -140;
          b = 150;
        }
        if (num == 2) {
          a = 70;
          b = 150;
        }
        if (num == 3) {
          a = 140;
          b = 150;
        }
        if (num == 4) {
          a = 0; 
          b = 150;
        }
        if (num == 5) {
          a = -350;
          b = 220;
        }
        if (num == 6) {
          a = 350;
          b = 220;
        }
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(80),5,color(160,32,240)));
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(85),5,color(160,32,240)));
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(90),5,color(160,32,240)));
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(95),5,color(160,32,240)));
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(100),5,color(160,32,240)));
        if(Math.random() <.25)monsters.add(new Missile(x,y));
        timer = millis();
      }
    }
    if (m == 1) {
      if (millis() - timer > 100) {
        int num = (int)(10*Math.random());
        int a = 0;
        int b = 0;
        if (num == 0) {
          a = -70;
          b = 150;          
        }
        if (num == 1) {
          a = -140;
          b = 150;
        }
        if (num == 2) {
          a = 70;
          b = 150;
        }
        if (num == 3) {
          a = 140;
          b = 150;
        }
        if (num == 4) {
          a = 0;
          b = 300;
        }
        if (num == 5) {
          a = 300;
          b = 220;
        }
        if (num == 6) {
          a = -300;
          b = 220;
        }
        color cc = color(160,32,240);
        if (Math.random() < 0.05) {
          cc = color(255,20,147);
        }
        enemyBullets.add(new enemyBullet(x-a,y+b,radians(90 + (int)(20*Math.random())),20,cc));
      }
    }
    if (m == 2) {
      
    }
    if (m == 3) {
    
    }
    
    if (right) {
      boss.x += 1;
    }
    else {
      boss.x -= 1;
    }
    if (boss.x > 600 || boss.x < 400 || Math.random() < 0.01) {
      right = !right;
    }
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
      timer = millis();
    }
    
  }
  
}
