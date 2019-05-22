

void setup() {
  size(1000,700);
}

void draw() {
  background(255);
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