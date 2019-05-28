class Bars{
  void display() {
    rectMode(CORNER);
    fill(255);
    rect(0, 625, width, 75);
    fill(255);
    rect(200, 640, 350, 15);
    fill(0,255,0);
    rect(200, 640, 350 * player.health / player.maxhealth, 15);
    textSize(13);
    fill(0);
    text("HEALTH: " + player.health + "/" + player.maxhealth, 220, 653);
    text("Weapon: " + player.getWeapon(), 650, 653);
    text("Ammo: " + player.getAmmo(), 650, 670);
  }
}
