class Player {
  int pNum;
  String name;
  int Lhand = 1;
  int Rhand = 1;
  Button lh = new Button(0, 0, 25, 50, Integer.toString(Lhand));
  Button rh = new Button(0, 0, 25, 50, Integer.toString(Rhand));
  Player(String n, int num) {
    name = n;
    pNum = num;
  }
  void show(float x, float y) {
    textAlign(CENTER, BOTTOM);
    textSize(64);
    text(name, x, y);
    lh.txt = Integer.toString(Lhand);
    lh.x = x-30.0;
    lh.y = y;
    rh.txt = Integer.toString(Rhand);
    rh.x = x+10;
    rh.y = y;
    lh.show();
    rh.show();
  }
  void makeClickable(){
    lh.clickable = true;
    rh.clickable = true;
  }
  void makeUnClickable(){
    lh.clickable = false;
    rh.clickable = false;
  }
}
