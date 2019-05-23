Player player;
Melee monster;
boolean running;
ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>();
ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>();

void setup() {
  size(1000,700);
  player = new Player(300,300);
  monster = new Melee(100,100);
}

void draw() {
  background(255);
  player.display();
  monster.move(0);
  monster.display();
  if(Math.random()<.01) monster.shoot();
  for(int i = 0;i< friendlyBullets.size();i++){
    friendlyBullets.get(i).move();
    if(friendlyBullets.get(i).check()){
      friendlyBullets.remove(i);
      i--;
    }
    else friendlyBullets.get(i).display();
  }
    for(int i = 0;i< enemyBullets.size();i++){
    enemyBullets.get(i).move();
    if(enemyBullets.get(i).check()){
      enemyBullets.remove(i);
      i--;
    }
    else enemyBullets.get(i).display();
  }
}

void keyPressed() {
  if (keyCode == 65) {
    player.move(0);
  }
  if (keyCode == 87) {
    player.move(2);
  }
  if (keyCode == 83) {
    player.move(3);
  }
  if (keyCode == 68) {
    player.move(1);
  }
}

void keyReleased(){
    if (keyCode == 65) {
    player.unmove(0);
  }
  if (keyCode == 87) {
    player.unmove(2);
  }
  if (keyCode == 83) {
    player.unmove(3);
  }
  if (keyCode == 68) {
    player.unmove(1);
  }
}

void mouseClicked() {
  friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
}