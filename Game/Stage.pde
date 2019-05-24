class Stage{
  Player player;
  Melee monster;
  ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>();
  ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>();

  Stage() {
    player = new Player(300,300);
    monster = new Melee(100,100);
    display();
  }
  
  void display() {
    player.display();
    monster.move(0);
    monster.display();
    for(int i = 0;i< friendlyBullets.size();i++){
      friendlyBullets.get(i).move();
      if(friendlyBullets.get(i).check()){
        friendlyBullets.remove(i);
        i--;
      }
      else friendlyBullets.get(i).display();
    }
  }
}
