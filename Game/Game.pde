Player player;
Melee monster;
ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>();
ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>();
ArrayList<wall> walls = new ArrayList<wall>();
String mode;
Playbutton playbutton;
boolean rapid; //helper variable for rapid fire (toggles on and off with mouse)
int t; //helper variable for rapid fire (regulates fire rate)
Bars bars;

void setup() {
  size(1000,700);
  player = new Player(300,300);
  monster = new Melee(100,100);
  mode = "main";
  playbutton = new Playbutton(width/2, height/2, 20, 20);
  walls.add(new permWall(200,200));
  bars = new Bars();
}

void draw() {
  //System.out.println(mode);
  if (mode.equals("main")) {
    background(255);
    playbutton.display();
  }
  if (mode.equals("stage")) {
    background(255);
    bars.display();
    player.changeHealth(-1);
    //CREATING WALLS
    for(int i = 0;i<walls.size();i++){
      walls.get(i).display();
    }
    player.display();
    monster.move(0);
    monster.display();
    monster.shoot();
    
    //RAPID FIRE FUNCTION
    if(rapid && t%5 == 0){
     friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
    }
    t++;
    
   //CHECKING BOUNDS AND DISPLAYING FREINDLY BULLETS
    for(int i = 0;i< friendlyBullets.size();i++){
      friendlyBullets.get(i).move();
      if(friendlyBullets.get(i).check()){
        friendlyBullets.remove(i);
        i--;
      }
      else friendlyBullets.get(i).display();
    }
   
   //CHECKING BOUNDS AND DISPLAYING FOR ENEMY BULLETS
      for(int i = 0;i< enemyBullets.size();i++){
      enemyBullets.get(i).move();
      if(enemyBullets.get(i).check()){
        enemyBullets.remove(i);
        i--;
      }
      else enemyBullets.get(i).display();
    }
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
  if(keyCode == 69){
    player.changeFireMode();
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

void mousePressed() {
  if (mode == "main") {
    if (playbutton.inButton()) {
      mode = "stage";
    }
  }
  if (mode == "stage") {
    if(player.fireMode == 0){//REGULAR SINGLE SHOT MODE
    friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
    }
    if(player.fireMode == 1){//SHOTGUN MODE
      friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.523599)); //+ 30 degrees
      friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.261799)); //+ 15 degrees
      friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x)))); //where the mouse is
      friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.261799)); //- 15 degrees
      friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.523599)); //- 30 degrees
    }
    if(player.fireMode == 2){//RAPID FIRE MODE
      rapid = true;
    }
  }
}

void mouseReleased(){
  rapid = false;
}
