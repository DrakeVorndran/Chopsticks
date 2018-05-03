class Button {
  float x, y, w, h;
  String txt;
  boolean clickable = false;
  Button(float X, float Y, float W, float H, String s) {
    x = X;
    y = Y;
    w = W;
    h = H;
    txt = s;
  }
  void show() {
    if (clickable) {
      fill(200);
      stroke(0);
    } else {
      fill(230); 
      stroke(200);
    }
    rect(x, y, w, h);
    textSize(h-10);
    if (clickable) {
      fill(0);
    } else {
      fill(200);
    }
    textAlign(TOP, TOP);
    text(txt, x, y);
  }
  boolean checkClick() {
    if (clickable) {
      //System.out.println("checked");
      //System.out.print(this.x);
      //System.out.print(" ,");
      //System.out.print(this.y);
      //System.out.print(" - ");
      //System.out.print(this.x+w);
      //System.out.print(" ,");
      //System.out.println(this.y+h);
      if (mouseX-width/2 > this.x && mouseX-width/2 < this.x+w && mouseY-height/2 > this.y && mouseY-height/2 < this.y+h) {
        System.out.println("clicked");
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
} 
