class Virus {

  //properties//
  private float virX; // x coordinate of the virus
  private float virY; // y coordinate of the virus
  private float virXspeed; // speed along the x axis
  private float virYspeed; // speed along the y axis
  private float virSize; // size of the virus
  PImage virus; // image name of the virus
  String s= "you are infected"; // TEXT displayed on game over screen//
  float h= height;
  float w= width;

  // default constructor//
  Virus () {
    this.virX= random(100, w/2); // sets the starting location of the virus at random
    this.virY= random(100, h/2);
    this.virXspeed = random(4, 7);// speed of the virus
    this.virYspeed= random(4, 7);
    this.virSize= 60; //size of the virus
  }

  // Overloaded constructor 1//
  Virus (float virX, float virY) {
    this.virX= virX; // sets the starting location of the virus at random
    this.virY= virY;
    this.virXspeed = random(4, 7);// speed of the virus
    this.virYspeed= random(4, 7);
    this.virSize= 60; //size of the virus
  }

  // Overloaded constructor 2//
  Virus (float virX, float virY, float virXspeed) {
    this.virX= virX; // sets the starting location of the virus at random
    this.virY= virY;
    this.virXspeed = virXspeed;// speed of the virus
    this.virYspeed= random(4, 7);
    this.virSize= 60; //size of the virus
  }

  // Overloaded constructor 3//
  Virus (float virX, float virY, float virXspeed, float virYspeed) {
    this.virX= virX; // sets the starting location of the virus at random
    this.virY= virY;
    this.virXspeed = virXspeed;// speed of the virus
    this.virYspeed= virYspeed;
    this.virSize= 60; //size of the virus
  }

  // Overloaded constructor 4//
  Virus (float virX, float virY, float virXspeed, float virYspeed, float virSize) {
    this.virX= virX; // sets the starting location of the virus at random
    this.virY= virY;
    this.virXspeed = virXspeed;// speed of the virus
    this.virYspeed= virYspeed;
    this.virSize= virSize; //size of the virus
  }


  //methods//
  // displays the image of the virus on a random location with a size of 60px
  void display() {
    virus= loadImage("virus.png");
    image( this.virus, this.virX, this.virY, this.virSize, this.virSize);
  }

  // movement of the virus across the screen with a random speed
  void move() {
    this.virX += this.virXspeed; // Increment x
    this.virY += this.virYspeed; // Increment y
    // Checks horizontal edges and reverses direction virus
    if (this.virX<this.virSize/2 || this.virX > w-this.virSize/2) {
      this.virXspeed *= -1;
    }
    //Check vertical edges and reverses direction of virus
    if (this.virY <this.virSize/2 || this.virY >h-this.virSize/2) {
      this. virYspeed *= -1;
    }
  }
  void infected() {
    this.virXspeed=0;
    this.virYspeed=0;
    fill(0);
    text(s, w/2, h/2);
  }

  void boost() {
    virXspeed++;
    virYspeed ++;
  }

  public void survived() {
    virus= loadImage("redCell.png");
    image( virus, virX, virY, virSize, virSize);
  }

  // getters//
  public float getvirX() {
    return this.virX;
  }
  public float getvirY() {
    return this.virY;
  }
  public float getvirXspeed() {
    return this.virXspeed;
  }
  public float getvirYspeed() {
    return this.virYspeed;
  }
  public float getvirSize() {
    return this.virSize;
  }

  // setters for virus size//
  public void setvirSize( float virSize) {
    if ((virSize >60)&&(virSize <=height/6)) {
      this.virSize = virSize;
    } else {
      this.virSize =60;
    }
  }
}
