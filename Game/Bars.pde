class Bars{
  void display() {
    rectMode(CORNER);
    fill(255);
    rect(0, 625, width, 75);
    fill(255);
    rect(200, 640, 350, 15);
    fill(255,0,0);
    rect(200, 640, 350 * player.health / 100, 15);
    textSize(13);
    fill(0);
    text("HEALTH: " + player.health + "/100", 220, 653);
  }
}
