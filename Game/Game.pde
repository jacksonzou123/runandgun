Player player;
ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>();
ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>();

void setup() {
  size(1000,800);
  player = new Player(300,300);
}

void draw() {
  background(255);
  player.display();
  for(int i = 0;i< friendlyBullets.size();i++){
    friendlyBullets.get(i).move();
    if(friendlyBullets.get(i).check()){
      friendlyBullets.remove(i);
      i--;
    }
    else friendlyBullets.get(i).display();
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

void mouseClicked() {
  friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
}