class Mode{
  String mode;
  Mainmenu mainmenu;
  Stage stage;
  
  Mode() {
    mode = "main";
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
    if (mainmenu.inbutton()) {
      mode = "stage";
      stage = new Stage();
    }
  }
  
  void stage() {
    stage.display();
  }
  
  void pause() {
  }
}