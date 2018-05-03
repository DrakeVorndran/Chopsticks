Player[] players;
float angle;
int turn;
int currPlayer;
int numPlayers = 10;
float dist = 150;
float xcoord;
float ycoord;
int step = 0;
int valHold;
Player pPicked;
boolean hPicked;
Button buttonPressed;
void setup() {
  size(500, 500);

  players = new Player[numPlayers];
  turn = 360/numPlayers;
  for (int x = 0; x<numPlayers; x++) {
    players[x] = new Player(Integer.toString(x), x);
  }
  currPlayer = 0;
}

void pause(int mils) {
  float start = millis();
  while (millis()<start+mils) {
  }
}
void render() {
  for (int x = 0; x<numPlayers; x++) {
    textSize(32);
    fill(0);
    xcoord = (dist*cos(degToRad(angle-(turn*x))));
    ycoord = (dist*sin(degToRad(angle-(turn*x))));
    players[x].show(xcoord, ycoord);
  }
}
float degToRad(float ang) {
  return(ang*PI/180.0);
}
void sweep() {
  float degchange = .01;
  for (float x = 0; x<turn; x+=degchange) {
    System.out.println(angle);
    angle+=degchange;
    render();
    pause(5);
  }
}
void keyPressed() {
  //sweep();
  currPlayer+=1;
  currPlayer%=numPlayers;
  System.out.println(currPlayer);
}
void mouseClicked() {
  //System.out.print(mouseX);
  //System.out.print(" ,");
  //System.out.println(mouseY);
  buttonPressed = null;
  for (int x = 0; x<numPlayers; x++) {

    if (players[x].lh.checkClick()) {
      System.out.print(x);
      System.out.println(" L");
      buttonPressed = players[x].lh;
      pPicked = players[x];
      hPicked = true;
    }
    if (players[x].rh.checkClick()) {
      System.out.print(x);
      System.out.println(" R");
      buttonPressed = players[x].rh;
      pPicked = players[x];
      hPicked = false;
    }
  }
}
int dev = 1;
void draw() {

  //angle = turn*currPlayer;
  if (int((currPlayer*turn/dev))%360!=int(((angle-90)%360)/dev)) {
    //System.out.println(angle);
    angle+= ((currPlayer*turn-(angle-90)))/20;
    //angle%=360;
    //if(rep>50){
    // angle = (currPlayer*turn)+90; 
    //}
  }
  if (step == 0) {
    for (int i = 0; i<numPlayers; i++) {
      if (i == currPlayer) {
        players[i].makeClickable();
      } else {
        players[i].makeUnClickable();
      }
      if (players[i].Lhand==0) {
        players[i].lh.clickable = false;
      }
      if (players[i].Rhand==0) {
        players[i].rh.clickable = false;
      }
    }
  } else if (step == 1) {
    for (int i = 0; i<numPlayers; i++) {
      if (i == currPlayer) {
        players[i].makeUnClickable();
      } else {
        players[i].makeClickable();
      }
      if (players[i].Lhand==0) {
        players[i].lh.clickable = false;
      }
      if (players[i].Rhand==0) {
        players[i].rh.clickable = false;
      }
    }
  }
  if (buttonPressed!=null) {
    //System.out.println("hi");
    if (step==0) {
      valHold = Integer.parseInt(buttonPressed.txt);
      step++;
      //System.out.println("hi");
      buttonPressed = null;
    }

    else if (step == 1) {
      step = 0;
      //System.out.println("hi2");
      if (hPicked) {
        pPicked.Lhand = (pPicked.Lhand+valHold)%5;
        System.out.println("hi");
      } else {
        pPicked.Rhand = (pPicked.Rhand+valHold)%5;
        System.out.println("hi2");
      }
      currPlayer = pPicked.pNum;
      buttonPressed = null;
    }
  }

  translate(width/2, height/2);
  background(255);
  render();
}
