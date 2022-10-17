
import javax.swing.JOptionPane;

// image variables//
PImage logo; // Set up screen image " VIRAL INVASION"
PImage redCellset; // red blood cell image//
PImage virusSet; // virus image//
PImage vacimg; // vaccine image//
PImage vein; // inside view of a vein image//
PImage startButton;  // start button image//

//variables//
int maxTime;
int timeLeft;
int maxLife;
int life;
int minScore;
int score;
int score1P;
int score2P;
int minScore1p;
int minScore2p;
String gameState;


int v=Integer.parseInt(
  JOptionPane.showInputDialog("how many viruses?", "10" ) // user input number of Viruses//
  );
int vc=Integer.parseInt(
  JOptionPane.showInputDialog("how many vaccines?", "3" ) // user input number of vaccine//
  );

// array declarations with fixed number values//
Oxygen[] o2 =new Oxygen[10];   // array of oxygen//
Oxygen2p[] o2p= new Oxygen2p[10]; // array of oxygen for the 2 PLAYER mode//
Virus[] redVirus= new Virus[v]; // array of viruses//
Vaccine[] vac= new Vaccine[vc]; // array of vaccines//


Redcell redCell; //Redcell class//
Virus2p v2p; // Virus for the 2 Player class//
CountDownTimer timer; // timer countdown class//




void setup() {
  size(612, 465);  // the screen size is set based on the size of the background image//

  gameState= "SET"; // initial game set up//


  redCell= new Redcell(width/2-40, height/2+165, 40, 10);  // Red cell class passing X/Y position, size and speed //


  v2p= new Virus2p(width/2+40, height/2+165, 40, 10);    // Virus for 2 players Class passing X/Y position //

  //timer Class and declarations//
  timer = new CountDownTimer(1000);
  maxTime= 40;  // sets time for the countdown timer//
  timeLeft =maxTime;
  maxLife=100;

  //declations for the scoring system//
  minScore=0;
  score=minScore;
  minScore1p=0;
  minScore2p=0;
  score1P=minScore1p;
  score2P=minScore2p;
  life= maxLife;
}

void draw() {
  // game states//
  // 2 game modes ( SOLO and 2 PLAYER Mode)//
  if (gameState == "SET") {// initial set up for the game
    setGame();
  } else if (gameState == "START1P") {  // game state for SOLO PLAYER mode//
    startGame1P();
  } else if (gameState == "START2P") {  // main game state for 2 PLAYER DUEL MODE//
    startGame2P();
  } else if (gameState =="INFECTED") {     // lose game state//
    loseGame();
  } else if (gameState == "SURVIVED") {    // win game state//
    winGame();
  } else if (gameState=="1PWIN") {    // player 1 win game state//
    winOneP();
  } else if (gameState =="2PWIN") {    // player 2 win game state
    winTwoP();
  }
}

// main game set up//
void setGame() {

  background(5);

  // image and text set up  for the game title "VIRAL INVASION"//
  imageMode(CENTER);
  logo= loadImage("logo.png");
  image(logo, width/2, 100, 350, 220);

  // Red Cell- actual image of the red cells in the blood- main purpose is to carry oxygen to different body parts//
  textAlign(LEFT);
  textSize(14);
  fill(255, 0, 50);
  text("you are a red cell ", 150, 225);
  redCellset= loadImage("redCell.png");
  image(redCellset, 370, 220, 40, 40);

  // Oxygen- simple ellipse to represent the oxygen molecule//
  textAlign(LEFT);
  textSize(14);
  fill(240, 250, 227);
  text("catch the oxygen to survive ", 150, 270);
  fill(240, 250, 227);
  ellipse(370, 265, 30, 30);

  //Vaccine- increases time left//
  textAlign(LEFT);
  textSize(14);
  fill(171, 219, 227);
  text("vaccine increases time ", 150, 320);
  vacimg= loadImage("vaccine.png");
  image(vacimg, 370, 310, 40, 40);


  // Virus- covid virus generated image
  virusSet= loadImage("virus.png");
  image(virusSet, 370, 370, 40, 40);// hardcoded position of the Virus image//
  textAlign(LEFT);
  textSize(14);
  fill(0, 255, 0);
  text("the virus will infect you ", 150, 370);

  // game mode selectors//
  textAlign(CENTER);
  textSize(14);
  fill(255, 255, 0);
  text("PRESS 1 for SOLO MODE", 290, 420);     
  text("PRESS 2 for 2 PLAYER DUEL MODE", 290, 445);
  if (( keyPressed && key == '1')) {
    gameState ="START1P";         // if key " 1 " pressed move to SOLO PLAY MODE//
  } else if ( ( keyPressed && key == '2')) {
    gameState ="START2P";        // if key " 2 " pressed move to 2 PLAYER DUEL MODE//
  }

  // array declaration in a for loop- sets the amount of items in the game//
  for (int i=0; i< o2.length; i++) { // number of Oxygen in the game//
    o2[i]= new Oxygen();
  }
  for (int i=0; i< o2p.length; i++) { // number of Oxgen for the 2 player mode//
    o2p[i]= new Oxygen2p();
  }
  for (int i=0; i< redVirus.length; i++) { // number of Viruses in the game//
    redVirus[i]= new Virus();
  }
  for (int i=0; i< vac.length; i++) { // number of vaccines in the game//
    vac[i]= new Vaccine();
  }


  timer.begin();  //starts the timer countdown//
}

// DRAW function used for the Solo Play Mode//
void startGame1P() {
  noCursor();           //removes the cursor within the game//
  vein= loadImage("veinbg.jpg");  // the background is an image of the insides of an actual blood vessel//
  background(vein);

  imageMode(CENTER);   //sets images in CENTER//
  background(vein);

  // calls RedCell Class//
  redCell.display();  // displays redCell position and size//
  redCell.move();    // movement controls for the red cell//

  // Collision detection for the Red Cell and Oxygen//
  for (Oxygen a : o2) {
    a.move(); // movement behaviour from Oxygen Class//
    a.display(); //displays oxygen//

    //if collision detected and player presses 'SPACEBAR' key, stops the oxygen and move them away from the screen adding 10 points to score//
    boolean collision= intersect(a);
    if ((collision == true) && (keyPressed && key ==' ')) {
      a.caught();
      score= score+10;
    }
    //if score reaches 100, ends the game= win game state//
    if (score== 100) {
      gameState= "SURVIVED";
    }
  }
  // Collision detection for the Virus and RedCell//
  for (Virus b : redVirus) {
    b.move(); // movement behaviour of the virus//
    b.display(); // displays image of virus from Virus class//

    //if collision detected, life decreases and speeds up the virus speed//
    boolean collision= intersect(b);
    if (collision == true) {
      life--;    // life down when hit//
      b.boost();// if there is collision virus speeds up//
    } 

    // if life <1 = lose game state//
    else if (life<1) {
      gameState= "INFECTED";// game over screen//
    }
  }
  //Collision detection for the Vaccine and Red Cell//
  for (Vaccine c : vac) {
    c.move();  // movement behaviour of the Vaccine//
    c.display(); // displays position, image adn size of vaccine//

    //if collision detected and player presses 'SPACEBAR' key, stops the vaccine and move them away from the screen adding 5 seconds to timeleft//
    boolean collision= intersect(c);
    if ((collision == true) && (keyPressed && key ==' ')) {
      c.caught();
      timeLeft= timeLeft+5;
    }
  }

  // count down timer- if timer <1 = game over state //
  if ( timer.complete() == true)
    if (timeLeft >1) {
      timeLeft--;
      timer.begin();
    } else {
      gameState = "INFECTED";
    }


  // displays countdown timer on game screen//
  String s=  "Time Left:" + timeLeft;
  textAlign(CENTER);
  textSize(30);
  fill(255);
  text(s, width/2, 30);

  // displays Oxygen% (score) on screen//
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Oxygen%:"+score, 20, 30);

  // displays Life% (life) on screen//
  textAlign(RIGHT);
  textSize(20);
  fill(255);
  text("Life%:"+life, width- 50, 30);
}

// 2 PLAYER DUEL MODE //
void startGame2P() {
  noCursor();   // removes the cursor within the game//
  vein= loadImage("veinbg.jpg");   //loads background image//
  background(vein);
  imageMode(CENTER);  // image mode set to center//
  redCell.display();   // displays red cell position, image and size ( PLAYER 1) //
  redCell.move();  // movement controls for  PLAYER 1 //
  v2p.display();  // displays virus position, image and size ( PLAYER 20//
  v2p.move();  // // movement controls for  PLAYER 2 //

  for (Oxygen a : o2) {
    a.move(); // movment behavoiur of oxygen for PLAYER 1//
    a.display(); // displays white oxygen for PLAYER 1 to catch//

    //if collision detected and player presses 'SPACEBAR' key, stops the oxygen and move them away from the screen adding 10 points to  PLAYER 1 score//
    boolean collision= intersect(a);
    if ((collision == true) && (keyPressed && key ==' ')) {
      a.caught(); // moves oxygen off screen//
      score1P= score1P+10; // 10 points to PLAYER 1 score//
    }
  }

  for (Oxygen2p b : o2p) {
    b.move(); // movement behaviour of oxygen for PLAYER 2//
    b.display();  // displays black oxygen for PLAYER 2 to catch//

    //if collision detected and player presses '0' key, stops the oxygen and move them away from the screen adding 10 points to  PLAYER 2 score//
    boolean collision= intersect(b);
    if ((collision == true) && (keyPressed && key =='0')) {
      b.caught();     // moves oxgen off screen//
      score2P= score2P+10;  //10 points to PLAYER 2//
    }
  }

  //whichever PLAYER score 100 first wins//
  if (score1P==100) {
    gameState="1PWIN"; // shows PLAYER 1 win screen//
  } else if (score2P == 100) {
    gameState="2PWIN"; // shows PLAYER 2 win screen//
  }

  //if timer finishes without a winner - game over//
  if ( timer.complete() == true)
    if (timeLeft >1) {
      timeLeft--;
      timer.begin();
    } else {
      gameState = "INFECTED"; // game over screen//
    }

  // show countdown//
  String s=  "Time Left:" + timeLeft;
  textAlign(CENTER);
  textSize(30);
  fill(255);
  text(s, width/2, 30);


  // shows PLAYER 1 score//
  textAlign(LEFT);
  textSize(20);
  fill(255);
  text("Player 1:"+score1P, 20, 30);

  // shows PLAYER 2 score//
  textAlign(RIGHT);
  textSize(20);
  fill(255);
  text("Player 2:"+score2P, width- 50, 30);
}

// Game over//
void loseGame() {
  redCell.infected();  // changes red cell image to virus image//

  // shows game over screen//
  textAlign(CENTER);
  textSize(60);
  fill(255, 255, 0);
  text("YOU ARE INFECTED", width/2, height/2);

  // option to reset game or to quit//
  textAlign(CENTER);
  textSize(20);
  text("play again? press ENTER", width/2, height/2+100);
  text("Quit? press Q", width/2, height/2+130);
  if (keyPressed && key == ENTER) {  // if ENTER is pressed resets back to set up screen//
    gameState = "SET";
    resetGame();   // resets time and scores//
  } else {
    if (keyPressed && key == 'q' || key == 'Q') {   // quits the game//
      exit();
    }
  }
}

// win game state//
void winGame() {
  for (Virus b : redVirus) {
    b.survived(); // changes all the virus image to red cell//
  }
  // win screen//
  textAlign(CENTER);
  textSize(60);
  fill(255, 255, 0);
  text("YOU SURVIVED!!", width/2, height/2);

  textAlign(CENTER);
  textSize(20);
  text("play again? press ENTER", width/2, height/2+100);
  text("Quit? press Q", width/2, height/2+130);

  if (keyPressed && key == ENTER) { // resets game back to set up screen//
    gameState = "SET";
    resetGame(); // resets oxygen , time, and life//
  } else {
    if (keyPressed && key == 'q' || key == 'Q') { // quit the game//
      exit();
    }
  }
}

// PLAYER 1 win screen//
void winOneP() {
  textAlign(CENTER);
  textSize(60);
  fill(255, 255, 0);
  text("PLAYER 1 Wins!!", width/2, height/2);

  textAlign(CENTER);
  textSize(20);
  text("play again? press ENTER", width/2, height/2+100);
  text("Quit? press Q", width/2, height/2+130);

  if (keyPressed && key == ENTER) { // resets game back to set up screen//
    gameState = "SET";
    resetGame(); // resets oxygen , time, and life//
  } else {
    if (keyPressed && key == 'q' || key == 'Q') { // quit the game//
      exit();
    }
  }
}

// PLAYER 2 win screen//
void winTwoP() {
  textAlign(CENTER);
  textSize(60);
  fill(255, 255, 0);
  text("PLAYER 2 Wins!!", width/2, height/2);
  textAlign(CENTER);
  textSize(20);
  text("play again? press ENTER", width/2, height/2+100);
  text("Quit? press Q", width/2, height/2+130);

  if (keyPressed && key == ENTER) { // resets game back to set up screen//
    gameState = "SET";
    resetGame(); // resets oxygen , time, and life//
  } else {
    if (keyPressed && key == 'q' || key == 'Q') { // qut game//
      exit();
    }
  }
}

// resets the game number/scores//
void resetGame() {
  timeLeft =maxTime;
  life= maxLife;
  score=minScore;
  score1P=minScore1p;
  score2P=minScore2p;
}

// collision detection using distance of the virus and the redcell using respective X and Y positions//
boolean intersect(Virus redVirus) {
  float distance = dist(redVirus.getvirX(), redVirus.getvirY(), redCell.getredX(), redCell.getredY());
  if (distance < redVirus.getvirSize()/2+redCell.getredSize()/2) {
    return true;
  } else {
    return false;
  }
}

// collision detection using distance of the oxygen and the redcell using respective X and Y positions//
boolean intersect(Oxygen o2) {
  float distance = dist(o2.geto2X(), o2.geto2Y(), redCell.getredX(), redCell.getredY());
  if (distance < o2.geto2Size()/2+redCell.getredSize()/2) {
    return true;
  } else {
    return false;
  }
}

// collision detection using distance of the vaccine and the redcell using respective X and Y positions//
boolean intersect(Vaccine vac) {
  float distance = dist(vac.getvacX(), vac.getvacY(), redCell.getredX(), redCell.getredY());
  if (distance < vac.getvacSize()/2+redCell.getredSize()/2) {
    return true;
  } else {
    return false;
  }
}

// collision detection using distance of the oxygen(PLAYER 2) and the Virus( PLAYER2) using respective X and Y positions//
boolean intersect(Oxygen2p o2p) {
  float distance = dist(o2p.geto2pX(), o2p.geto2pY(), v2p.getv2pX(), v2p.getv2pY());
  if (distance < o2p.geto2pSize()/2+v2p.getv2pSize()/2) {
    return true;
  } else {
    return false;
  }
}
