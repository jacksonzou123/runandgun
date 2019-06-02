class Bars{
  void display() {
    rectMode(CORNER);
    fill(255);
    rect(0, 625, width, 75);
    fill(255,0,0);
    rect(200, 640, 350, 15);
    fill(0,255,0);
    rect(200, 640, 350 * player.health / player.maxhealth, 15);
    
    //PLAYER STAT BARS
    textSize(13);
    fill(0);
    text("HEALTH: " + player.health + "/" + player.maxhealth, 220, 653);
    text("Weapon: " + player.getWeapon(), 650, 653);
    text("Ammo: " + player.getGun(), 650, 670);
    text("Shields: "+ player.shields,825 ,653);
    
    //Boss Stats
    rectMode(CORNER);
    fill(255,0,0);
    rect(200,0,600,15);
    fill(0,255,0);
    rect(200,0,(float)boss.health/boss.maxhealth * 600,15);
    text("Health: " + boss.health, 200,0);
  }
}
