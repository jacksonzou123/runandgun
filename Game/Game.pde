Player player;

void setup() {
  size(1000,800);
  player = new Player(300,300);
}

void draw() {
  background(255);
  player.display();
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