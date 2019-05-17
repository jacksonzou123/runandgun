void setup() {
  size(600,600);
  tri(50,50,40,0);
}

void draw() {

}


void tri(float x,float y,float side,float angle){
  tr(x,y,side,angle+180);
}

void tr(float x,float y,float side,float angle){
  triangle((side/2)*sin(radians(angle))+x,(side/2)*cos(radians(angle))+y,(side/2)*sin(radians(angle+120))+x,(side/2)*cos(radians(angle+120))+y,(side/2)*sin(radians(angle+240))+x,(side/2)*cos(radians(angle+240))+y);
}
