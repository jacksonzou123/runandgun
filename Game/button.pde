abstract class button{
  float x,y;
  float l,w;
  
  button(float x, float y, float l, float w) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
  }
  
  boolean inButton() {//checks if mouse is over the button 
    if (abs(mouseX - x) < l/2 && (abs(mouseY - y) < w/2)) {
      return true;
    }
    return false;
  }
  
  abstract void display();
}

//PLAYBUTTON CODE
class Playbutton extends button{
  Playbutton(float x, float y, float l, float w) {
    super(x,y,l,w);
  }
  
  void display() {
    rectMode(CENTER);
    fill(186,186,186);
    rect(x,y,l,w);
  }
}
