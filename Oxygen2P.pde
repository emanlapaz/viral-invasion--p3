// oxygen class for the 2PLAYER//
class Oxygen2p {
  private float o2pX; // x coordinate of oxygen
  private float o2pY; // y coordinate of oxygen
  private float o2pXspeed; //speed along x axis
  private float o2pYspeed; // speed along y axis
  private float o2pSize; // size of oxygen

  //Default constructors//
  Oxygen2p () {

    this.o2pX= random(o2pSize+10, width/3); // sets the starting location of the oxygen at random
    this.o2pY= random(o2pSize+10, height/3);
    this.o2pXspeed = random(4, 6);  // speed of the oxygen
    this.o2pYspeed= random(4, 6);
    this.o2pSize= 30; // size of the oxygen
  }

  //Overloaded constructor 1//
  Oxygen2p( float o2pX, float o2pY) {
    this.o2pX= o2pX;
    this.o2pY= o2pY;
    this.o2pXspeed = random(6, 9);    // speed of the oxygen
    this.o2pYspeed= random(6, 9);
    this.o2pSize= 30;    // size of the oxygen
  }
  //Overloaded constructor 2//
  Oxygen2p( float o2pXspeed, float o2pYspeed, float o2pSize) {
    this.o2pX= random(o2pSize+10, width/3);
    this.o2pY= random(o2pSize+10, height/3);
    this.o2pXspeed = o2pXspeed;    // speed of the oxygen
    this.o2pYspeed= o2pYspeed;
    this.o2pSize= o2pSize;  // size of the oxygen
  }

  //Overloaded constructor 3//
  Oxygen2p( float o2pX, float o2pY, float o2pXspeed, float o2pYspeed) {
    this.o2pX= o2pX;
    this.o2pY= o2pY;
    this.o2pXspeed = o2pXspeed;    // speed of the oxygen
    this.o2pYspeed= o2pYspeed;
    this.o2pSize= 30;    // size of the oxygen
  }

  //Overloaded constructor 4//
  Oxygen2p( float o2pX, float o2pY, float o2pXspeed, float o2pYspeed, float o2pSize) {
    this.o2pX= o2pX;
    this.o2pY= o2pY;
    this.o2pXspeed = o2pXspeed;    // speed of the oxygen
    this.o2pYspeed= o2pYspeed;
    this.o2pSize= o2pSize;    // size of the oxygen
  }

  //methods//

  // displays a white semi-transparent circle  on a random location with a size of 30px
  void display() {
    noStroke();
    fill(10, 10, 10, 100); // black oxygen for the 2PLAYER//
    circle(this.o2pX, this.o2pY, this.o2pSize);
  }
  public void caught() {
    
    this.o2pXspeed=0;
    this.o2pYspeed=0;
    this.o2pY= -100;
  }


  // movement of the virus across the screen with a random speed
  void move() {
    this.o2pX += this.o2pXspeed; // Increment x
    this.o2pY += this.o2pYspeed; // Increment y

    // Check horizontal edges and reverses direction of the oxygen
    if (this.o2pX<this.o2pSize/2 || this.o2pX > width-this.o2pSize/2) {
      this.o2pXspeed *= -1;
    }
    //Check vertical edges and reverses direction virus of the oxygen
    if (this.o2pY <this.o2pSize/2 || this.o2pY >height-this.o2pSize/2) {
      this.o2pYspeed *= -1;
    }
  }

  //getters
  public float geto2pX() {
    return this.o2pX;
  }
  public float geto2pY() {
    return this.o2pY;
  }
  public float geto2pXspeed() {
    return this.o2pXspeed;
  }
  public float geto2pYspeed() {
    return this.o2pYspeed;
  }
  public float geto2pSize() {
    return this.o2pSize;
  }

  //setter
  public void seto2pSize( float o2pSize) {
    if ((o2pSize >30)&&(this.o2pSize <=height/6)) {
      this.o2pSize = o2pSize;
    } else {
      this.o2pSize =30;
    }
  }
}
