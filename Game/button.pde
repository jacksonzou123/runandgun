abstract class button{
  float x,y;
  float l,w;
  
  button(float x, float y, float l, float w) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
  }
  
  boolean inButton() {
    if (abs(mouseX - x) < l/2 && (abs(mouseY - y) < w/2)) {
      return true;
    }
    return false;
  }
  
  abstract void display();
}