// virus class of the 2 PLAYER//
class Virus2p {
  
  //properties//
  private float v2pX; // x coordinate of the virus 2 player
  private float v2pY; // y coordinate of the virus 2 player
  private float speed;
  private float size; // size of virus 2 player
  private PImage v2pimg; // vuris image

// default constructor//
  Virus2p(float tempv2pX, float tempv2pY, float tempv2pSize, float tempSpeed) {
    this.v2pX= tempv2pX;
    this.v2pY= tempv2pY;
    this.speed= tempSpeed;
    this.size= tempv2pSize;
  }
  
  // overloaded constructor 1//
  Virus2p(float tempv2pX, float tempv2pY) {
    this.v2pX= tempv2pX;
    this.v2pY= tempv2pY;
  }
  
  // overloaded constructor 2//
  Virus2p(float tempv2pX, float tempv2pY, float tempv2pSize) {
    this.v2pX= tempv2pX;
    this.v2pY= tempv2pY;
    size= tempv2pSize;
  }
  
  
  //methods//
  // displays an image of the virus//
  void display() {
    v2pimg= loadImage("virus.png");
    circle(v2pX, v2pY, size);
    image(v2pimg, v2pX, v2pY, size, size);
  }

  // movement controls for the virus 2 PLAYER//
  void move() {
    if (keyPressed && (key == CODED)) { // move LEFT//
      if ((keyCode == LEFT) && ( v2pX > 0 )) {
        v2pX = v2pX - speed;
      } // bracket for LEFT
      if ((keyCode == RIGHT) && ( v2pX < width)) { // move RIGHT//
        v2pX = v2pX + speed;
      }
      if ((keyCode == UP) && ( v2pY > 0)) {// move UP//
        v2pY =  v2pY -speed;// bracket for RIGHT
      }
      if ((keyCode ==DOWN) && ( v2pY < height)) {// move DOWN//
        v2pY =  v2pY +speed; 
      }
    }
  }
  
  //getters//
  public float getv2pX() {
    return this.v2pX;
  }
  public float getv2pY() {
    return this.v2pY;
  }
  public float getv2pSize() {
    return this.size;
  }
}
