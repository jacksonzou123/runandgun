class Mode{
  String mode;
  Mainmenu mainmenu;
  Stage stage;
  
  Mode() {
    mode = "main";
    mainmenu = new Mainmenu();
  }
  
  void changeMode(String mode) {
    this.mode = mode;
  }
  
  void run() {
    if (mode.equals("main")) {
      mainmenu();
    }
    if (mode.equals("stage")) {
      stage();
    }
    if (mode.equals("pause")) {
      pause();
    }
  }
  
  void mainmenu() {
    mainmenu.display();
  }
  
  void stage() {
    stage.display();
  }
  
  void pause() {
  }
}
