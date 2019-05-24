class Playbutton extends button{
  Playbutton(float x, float y, float l, float w) {
    super(x,y,l,w);
  }
  
  void display() {
    rectMode(CENTER);
    fill(0);
    rect(x,y,l,w);
  }
}