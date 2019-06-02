Player player;
ArrayList<Melee> monsters = new ArrayList<Melee>(); //arraylist to keep track of enemies
ArrayList<enemyBullet> enemyBullets = new ArrayList<enemyBullet>(); //array list to keep track of enemy bullets
ArrayList<friendlyBullet> friendlyBullets = new ArrayList<friendlyBullet>(); //arraylist to keep track of friendly bullets 
ArrayList<wall> walls = new ArrayList<wall>(); //arraylist to keep track of walls
spawn[] spawners;
pspawn[] gets;
String mode;
Playbutton playbutton1;
Playbutton playbutton2;
boolean rapid; //helper variable for rapid fire (toggles on and off with mouse)
int t; //helper variable for rapid fire (regulates fire rate) and other stuff (like blinking title)
Bars bars;
Boss boss;

void setup() {
  size(1000,700);
  mode = "main";
  playbutton1 = new Playbutton(width/2, height/2+100, 80, 40);
  playbutton2 = new Playbutton(width/2, height/2 + 200, 160, 40);
}

//SETUP FOR FIRST LEVEL
void stage1() {
  player = new Player(500,600);
  spawners = new spawn[] {new monsterspawn(millis(),10,100,10000), 
                          new monsterspawn(millis()+1000,10,200,10000), 
                          new monsterspawn(millis()+2000,10,300,10000), 
                          new monsterspawn(millis()+3000,width - 10,100,10000), 
                          new monsterspawn(millis()+4000,width - 10,200,10000),
                          new monsterspawn(millis()+5000,width - 10,300,10000)};
  bars = new Bars();
  gets = new pspawn[] {new healspawn(millis(), 100, 600, 30000), new shotgunpack(millis(), width/2 - 100, 300, 20000), new assaultpack(millis(), width/2 + 100, 300, 20000)};
  walls.add(new permWall(750,500));
  walls.add(new permWall(250,500));
  walls.add(new permWall(730,520));
  walls.add(new permWall(270,520));
  walls.add(new permWall(710,540));
  walls.add(new permWall(290,540));
  boss = new BossUno(500,-100);
}

//SETUP FOR SECOND LEVEL
void stage2() {
  player = new Player(300,300);
  spawners = new spawn[0];
  bars = new Bars();
  gets = new pspawn[0];
  walls.add(new permWall(200,200));
  boss = new BossUno(500, 200);
}

void draw() {
  t++;
  //System.out.println(mode);
  if (mode.equals("main")) {//MENU SCREEN
    background(255);
    playbutton1.display();
    playbutton2.display();
    textSize(20);
    fill(0);
    text("Stage 1",width/2-35,height/2+105);
    text("Beta Testing",width/2-60,height/2+205);
    if(t%75 < 45){ //so that the text blinks 
      text("Click a button to start",width/2-105,370);
    }
    textSize(80);
    text("Game Title Here", width/2-300,110);
    textSize(30);
    text("By: Derek Leung and Jackson Zou",width/2 - 225,200);
  }
  
  if (mode.equals("animate")) {
    background(255);
    for (spawn spawner: spawners) {
      spawner.display();
    }
    for (pspawn pack: gets) {
      pack.display();
    }
    player.display();
    boss.display();
    boss.entrance();
    bars.display();
  }
  
  if (mode.equals("stage")) {
    background(255);
    if (player.health <= 0) {//returns player to menu once health reaches zero 
      mode = "main";
    }
    
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
    
    //DISPLAYING WALLS
    for(int i = 0;i<walls.size();i++){
      walls.get(i).display();
    }
    
    //displays player
    player.display();
    
    //displays boss
    boss.display();
    
    //displays and moves monsters
    for (int i = 0; i < monsters.size(); i++) {
      monsters.get(i).move(0);
      monsters.get(i).display();
      monsters.get(i).shoot();
      if (monsters.get(i).check()) {
        monsters.remove(i);
        i--;
      }
    }
    
    //RAPID FIRE FUNCTION
    if(rapid && t%5 == 0){
     if (player.hasAmmo(2)) {
       friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x)), 33, color(0,0,122)));
     }
    }
    //t++;
    
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
        
    //display the health/ammo bars on bottom
    bars.display();
    
    if(boss.health <= 0){
      mode = "main";
    }
  }
}

void keyPressed() {
  if (mode == "stage") {
    if (keyCode == 65 && walls.get(0).checkRight()){ //MOVING LEFT
      player.move(0);
    }
    if (keyCode == 87 && walls.get(0).checkDown()) { //MOVING UP
      player.move(2);
    }
    if (keyCode == 83 && walls.get(0).checkUp()) { //MOVING DOWN
      player.move(3);
    }
    if (keyCode == 68 && walls.get(0).checkLeft()) { //MOVING RIGHT
      player.move(1);
    }
    if(keyCode == 69){
      player.changeFireMode();
    }
    if(keyCode == 70){
      if(player.shields > 0){
      walls.add(new tempWall());
      player.shields--;
      }
    }
    if(keyCode == 82) player.health = 100; //CHEAT CODE FOR DEMONSTRATION 
  }
}

void keyReleased(){
  if (mode == "stage") {
    if (keyCode == 65) { //STOP MOVING LEFT
      player.unmove(0);
    }
    if (keyCode == 87) { //STOP MOVING UP
      player.unmove(2);
    }
    if (keyCode == 83) {//STOP MOVING DOWN
      player.unmove(3);
    }
    if (keyCode == 68) {//STOP MOVING RIGHT
      player.unmove(1);
    }
  }
}

void mousePressed() {
  if (mode == "main") {//looks for button clicking 
    if (playbutton1.inButton()) {
      mode = "animate";
      stage1();
    }
    if (playbutton2.inButton()) {
      mode = "stage";
      stage2();
    }
  }
  if (mode == "stage") {
    if(player.fireMode == 0){//REGULAR SINGLE SHOT MODE
    friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x)), 34, color(255,255,0)));
    }
    if(player.fireMode == 1){//SHOTGUN MODE 
      if (player.hasAmmo(1)) {
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.0872665+0.0872665, 25, color(255,0,0))); //+ 20 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))+0.0872665, 25, color(255,0,0))); //+ 10 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x)), 25, color(255,0,0))); //where the mouse is
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.0872665, 25, color(255,0,0))); //- 10 degrees
        friendlyBullets.add(new friendlyBullet(player.x,player.y,6.2831-(-1*atan2(mouseY-player.y,mouseX-player.x))-0.0872665-0.0872665, 25, color(255,0,0))); //- 20 degrees
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
