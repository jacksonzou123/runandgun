Mode gamemode;

void setup() {
  size(1000,700);
  gamemode = new Mode();
}

void draw() {
  background(255);
  gamemode.run();
}

void keyPressed() {
  if (gamemode.mode == "stage") {
    if (keyCode == 65) {
      gamemode.stage.player.move(0);
    }
    if (keyCode == 87) {
      gamemode.stage.player.move(2);
    }
    if (keyCode == 83) {
      gamemode.stage.player.move(3);
    }
    if (keyCode == 68) {
      gamemode.stage.player.move(1);
    }
  }
}

void keyReleased(){
    if (keyCode == 65) {
    gamemode.stage.player.unmove(0);
  }
  if (keyCode == 87) {
    gamemode.stage.player.unmove(2);
  }
  if (keyCode == 83) {
    gamemode.stage.player.unmove(3);
  }
  if (keyCode == 68) {
    gamemode.stage.player.unmove(1);
  }
}

void mouseClicked() {
  if (gamemode.mode == "main") {
    if (gamemode.mainmenu.inButton()) {
      gamemode.changeMode("stage");
      gamemode.stage = new Stage();
    }
  }
  if (gamemode.mode == "stage") {
    gamemode.stage.friendlyBullets.add(new friendlyBullet(gamemode.stage.player.x,gamemode.stage.player.y,6.2831-(-1*atan2(mouseY-gamemode.stage.player.y,mouseX-gamemode.stage.player.x))));
  }
}
