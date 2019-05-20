Player player;

void setup() {
  size(600,600);
  player = new Player(30,30);
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