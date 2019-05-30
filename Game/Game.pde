Player player;
ArrayList<Melee> monsters = new ArrayList<Melee>();
ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>();
ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>();
ArrayList<wall> walls = new ArrayList<wall>();
spawn[] spawners;
pspawn[] gets;
String mode;
Playbutton playbutton1;
Playbutton playbutton2;
boolean rapid; //helper variable for rapid fire (toggles on and off with mouse)
int t; //helper variable for rapid fire (regulates fire rate)
Bars bars;

void setup() {
  size(1000,700);
  mode = "main";
  playbutton1 = new Playbutton(width/2, height/2, 20, 20);
  playbutton2 = new Playbutton(width/2, height/2 + 200, 20, 20);
}

void stage1() {
  player = new Player(300,300);
  monsters.add(new Melee(100,150));
  monsters.add(new Melee(100,20));
  monsters.add(new Melee(2,150));
  monsters.add(new Melee(100,100));
  spawners = new spawn[] {new monsterspawn(millis(),100,100,5000)};
  walls.add(new permWall(200,200));
  bars = new Bars();
  gets = new pspawn[] {new healspawn(millis(), 900, 500, 5000), new shotgunpack(millis(), 900, 400, 5000), new assaultpack(millis(), 900, 300, 5000)};
}

void stage2() {
  player = new Player(300,300);
  spawners = new spawn[0];
  bars = new Bars();
  gets = new pspawn[0];
}

void draw() {
  //System.out.println(mode);
  if (mode.equals("main")) {
    background(255);
    playbutton1.display();
    playbutton2.display();
  }
  if (mode.equals("stage")) {
    background(255);
        
    if (player.health == 0) {
      mode = "main";
    }
    
    //display the health/ammo bars on bottom
    bars.display();

    //display the spawners and creates new monsters
    for (spawn spawner: spawners) {
      spawner.display();
      if (spawner.check(millis())) {
        spawner.create();
      }
    }
    
    //display the player packs (heal/shotgun)
    for (pspawn pack: gets) {
      pack.display(); 
      if (pack.check(millis())) {
        pack.give();
      }
    }
    
    //CREATING WALLS
    for(int i = 0;i<walls.size();i++){
      walls.get(i).display();
    }
    
    //displays player
    player.display();
    
    //displays and moves monsters
    for (int i = 0; i < monsters.size(); i++) {
      monsters.get(i).move(0);
      monsters.get(i).display();
      monsters.get(i).shoot();
      System.out.println(""+ monsters.get(i).health);
      if (monsters.get(i).check()) {
        monsters.remove(i);
        i--;
      }
    }
    
    //RAPID FIRE FUNCTION
    if(rapid && t%5 == 0){
     if (player.hasAmmo(2)) {
       friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
     }
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
    if (playbutton1.inButton()) {
      mode = "stage";
      stage1();
    }
    if (playbutton2.inButton()) {
      mode = "stage";
      stage2();
    }
  }
  if (mode == "stage") {
    if(player.fireMode == 0){//REGULAR SINGLE SHOT MODE
    friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))));
    }
    if(player.fireMode == 1){//SHOTGUN MODE
      if (player.hasAmmo(1)) {
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.523599)); //+ 30 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.261799)); //+ 15 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x)))); //where the mouse is
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.261799)); //- 15 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.523599)); //- 30 degrees
      }
    }
    if(player.fireMode == 2){//RAPID FIRE MODE
        rapid = true;
    }
  }
}

void mouseReleased(){
  rapid = false;
}