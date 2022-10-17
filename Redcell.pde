class Redcell {

  //properties//
  private float redX; // x coordinate of the red cell
  private float redY; // y coordinate of the red cell
  private float speed;
  private float size; // size of red cell
  private PImage redCellimg; // red cell image


  //Default constructor//
  Redcell(float tempRedX, float tempRedY, float tempRedSize, float tempSpeed) {
    redX= tempRedX;
    redY= tempRedY;
    speed= tempSpeed;
    size= tempRedSize;
  }

  //overloaded constructor 1//
  Redcell(float tempRedX, float tempRedY) {
    redX= tempRedX;
    redY= tempRedY;
  }
  //overloaded constructor 2//
  Redcell(float tempRedX, float tempRedY, float tempRedSize) {
    redX= tempRedX;
    redY= tempRedY;
    size= tempRedSize;
  }

  //methods//
  // displays a red cell image with an image size of 40px//
  void display() {
    redCellimg= loadImage("redCell.png");
    image(redCellimg, redX, redY, size, size);
  }
  // movement controls for the redcell( 1 PLAYER)//
  void move() {
    if ( keyPressed ) {
      if ((key == 'a' || key == 'A') && ( redX > 0 )) {
        redX = redX - speed;  // if "a/A" pressed move LEFT
      } 
      if ((key == 'd' || key == 'D') && ( redX < width )) {
        redX = redX + speed;  //  if "d/D" pressed move RIGHT
      } 
      if ((key == 'w' || key == 'W') && ( redY > 0 )) {
        redY = redY - speed; // if "w/W" pressed move UP
      }
      if ((key == 's' || key == 'S') && ( redY < height )) {
        redY = redY + speed; // if "s/S" pressed move DOWN
      }
    }
  }

  //changes the red cell image to the virus image when on lose state (1PLAYER)//
  public void infected() {
    redCellimg= loadImage("virus.png");
    circle(redX, redY, size);
    image(redCellimg, redX, redY, size+40, size+40);
  }


  //getters//
  public float getredX() {
    return redX;
  }
  public float getredY() {
    return redY;
  }
  public float getredSize() {
    return size;
  }
}
