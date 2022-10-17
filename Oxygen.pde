public class Oxygen {

  //properties//
  private float o2X; // x coordinate of oxygen
  private float o2Y; // y coordinate of oxygen
  private float o2Xspeed; //speed along x axis
  private float o2Yspeed; // speed along y axis
  private float o2Size; // size of oxygen

  //Default constructor//
  Oxygen () {
    this.o2X= random(o2Size+10, width/3);    // sets the starting location of the oxygen at random
    this.o2Y= random(o2Size+10, height/3);
    this.o2Xspeed = random(4,6);    // speed of the oxygen
    this.o2Yspeed= random(4,6);
    this.o2Size= 30;    // size of the oxygen
  }

  //Overloaded constructor 1//
  Oxygen( float o2X, float o2Y) {
    this.o2X= o2X;
    this.o2Y= o2Y;
    this.o2Xspeed = random(6, 9);    // speed of the oxygen
    this.o2Yspeed= random(6, 9);
    this.o2Size= 30;    // size of the oxygen
  }

  //Overloaded constructor 2//
  Oxygen( float o2Xspeed, float o2Yspeed, float o2Size) {
    this.o2X= random(o2Size+10, width/3);
    this.o2Y= random(o2Size+10, height/3);
    this.o2Xspeed = o2Xspeed;    // speed of the oxygen
    this.o2Yspeed= o2Yspeed;
    this.o2Size= o2Size;  // size of the oxygen
  }

  //Overloaded constructor 3//
  Oxygen( float o2X, float o2Y, float o2Xspeed, float o2Yspeed) {
    this.o2X= o2X;
    this.o2Y= o2Y;
    this.o2Xspeed = o2Xspeed;    // speed of the oxygen
    this.o2Yspeed= o2Yspeed;
    this.o2Size= 30;    // size of the oxygen
  }

  //Overloaded constructors 4//
  Oxygen( float o2X, float o2Y, float o2Xspeed, float o2Yspeed, float o2Size) {
    this.o2X= o2X;
    this.o2Y= o2Y;
    this.o2Xspeed = o2Xspeed;    // speed of the oxygen
    this.o2Yspeed= o2Yspeed;
    this.o2Size= o2Size;    // size of the oxygen
  }
// methods//
  // displays a white semi-transparent circle  on a random location with a size of 30px
  void display() {
    noStroke();
    fill(255, 100);
    circle(this.o2X, this.o2Y, this.o2Size);
  }
  public void caught() {
    if (keyPressed && key ==' ') {
      this.o2Xspeed=0;
      this.o2Yspeed=0;
      this.o2Y= -100;
    }
  }

  //methods//

  // movement of the virus across the screen with a random speed
  void move() {
    this.o2X += this.o2Xspeed; // Increment x
    this.o2Y += this.o2Yspeed; // Increment y

    // Check horizontal edges and reverses direction of the oxygen
    if (this.o2X<this.o2Size/2 || this.o2X > width-this.o2Size/2) {
      o2Xspeed *= -1;
    }
    //Check vertical edges and reverses direction virus of the oxygen
    if (this.o2Y <this.o2Size/2 || this.o2Y >height-this.o2Size/2) {
      this.o2Yspeed *= -1;
    }
  }

  //getters
  public float geto2X() {
    return this.o2X;
  }
  public float geto2Y() {
    return this.o2Y;
  }
  public float geto2Xspeed() {
    return this.o2Xspeed;
  }
  public float geto2Yspeed() {
    return this.o2Yspeed;
  }
  public float geto2Size() {
    return this.o2Size;
  }

  //setter
  public void seto2Size( float o2Size) {
    if ((o2Size >30)&&(o2Size <=height/6)) {
      this.o2Size = o2Size;
    } else {
      this.o2Size =30;
    }
  }
}
