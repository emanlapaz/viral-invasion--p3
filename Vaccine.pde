class Vaccine {

  //properties//
  private float vacX; // x coordinate of vaccine//
  private float vacY; // y coordinate of vaccine//
  private float vacXspeed; //speed along x axis//
  private float vacYspeed; // speed along y axis//
  private float vacSize; // size of vaccine//

  PImage vacimg; // vaccine image//

  //Default constructor//
  Vaccine() {
    this.vacX= random(200, width/3);  // sets the starting location of the vaccine at random//
    this.vacY= random(0, height/3);
    this.vacXspeed = random(3, 9);  // speed of the oxygen
    this.vacYspeed= random(3, 9);
    this.vacSize= 30;  // size of the oxygen
  }

  // overloaded constructor 1//
  Vaccine(float vacX, float vacY) {
    this.vacX= vacX; 
    this.vacY= vacY;
    this.vacXspeed = random(3, 9); 
    this.vacYspeed= random(3, 9);
    this.vacSize= 30;  
  }

  // overloaded constructor 2//
  Vaccine(float vacX, float vacY, float vacXspeed) {
    this.vacX= vacX;  // sets the starting location of the vaccine at random//
    this.vacY= vacY;
    this.vacXspeed = vacXspeed;  
    this.vacYspeed= random(3, 9);
    this.vacSize= 30;  
  }

  // overloaded constructor 3//
  Vaccine(float vacX, float vacY, float vacXspeed, float vacYspeed) {
    this.vacX= vacX; 
    this.vacY= vacY;
    this.vacXspeed = vacXspeed;  
    this.vacYspeed=  vacYspeed;
    this.vacSize= 30;  
  }

  // overloaded constructor 4//
  Vaccine(float vacX, float vacY, float vacXspeed, float vacYspeed, float vacSize) {
    this.vacX= vacX;  
    this.vacY= vacY;
    this.vacXspeed = vacXspeed;  
    this.vacYspeed=  vacYspeed;
    this.vacSize= vacSize;  
  }

  // methods//
  // displays a white semi-transparent circle  on a random location with a size of 30px
  void display() {
    vacimg= loadImage("vaccine.png");
    image( this.vacimg,  this.vacX,  this.vacY,  this.vacSize,  this.vacSize);
  }

  // moves the vaccine offscreen when collision and SPACEBAR pressed//
  public void caught() {
    if (keyPressed && key ==' ') {
       this.vacX=-100;
       this.vacY= -100;
    }
  }

  // movement of the vaccine across the screen with a random speed
  void move() {
     this.vacX += vacXspeed; 
     this.vacY += vacYspeed; 

    // Check horizontal edges and reverses direction of the oxygen
    if ( this.vacX<vacSize/2 ||  this.vacX > width- this.vacSize/2) {
       this.vacXspeed *= -1;
    }
    //Check vertical edges and reverses direction virus of the oxygen
    if ( this.vacY < this.vacSize/2 ||  this.vacY >height- this.vacSize/2) {
       this.vacYspeed *= -1;
    }
  }

  //getters
  public float getvacX() {
    return  this.vacX;
  }
  public float getvacY() {
    return  this.vacY;
  }
  public float getvacXspeed() {
    return  this.vacXspeed;
  }
  public float getvacYspeed() {
    return  this.vacYspeed;
  }
  public float getvacSize() {
    return  this.vacSize;
  }

  //setter
  public void setvacSize( float vacSize) {
    if ((vacSize >30)&&(vacSize <=height/6)) {
      this.vacSize = vacSize;
    } else {
      this.vacSize =30;
    }
  }
}
