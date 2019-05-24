class Mainmenu{
  
  Mainmenu() {
  }
  
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rect(-10,-5,20,10);
    popMatrix();
  }
  
  boolean inButton() {
    if (mouseX - width/2 < 20 && mouseX - width/2 > -20 && mouseY - height/2 < 10 && mouseY - height/2 > 0) {
      return true;
    }
    return false;
  }
}
