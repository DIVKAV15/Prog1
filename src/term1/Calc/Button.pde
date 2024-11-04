class Button {
  //Member Variable
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  //Constructor
  Button(int x, int y, String val, boolean isNum) {
    this.x=x;
    this.y=y;
    this.w=60;
    this. h=46;
    this.c1=color(0);
    this.c2=color(125);
    this.val=val;
    this.isNum=isNum;
    on=false;
    
  }

  //member meathods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 5);
    fill(255);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }


  boolean hover(int mx, int my) {
    if (mx >x-w/2 && mx< x+w/2 && my > y-h/2 && my < y+h/2) {
      on=true;
      return on;
    } else {
      on=false;
      return on;
    }
  }
}
