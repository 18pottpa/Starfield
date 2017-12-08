Particle[] myParticle;
void setup()
{
  size(600, 600);
  noStroke();
  myParticle = new Particle[300];
  for (int i=0; i<myParticle.length; i++) {// runs through particles and and created the array
    myParticle[i] = new NormalParticle();
  }
    myParticle[0] = new OddballParticle();// at 0 myparticle equals oddball
}
void draw()
{
  background(120);
  for (int i=0; i<myParticle.length; i++) {// for loop that runs through the program
  myParticle[i].move();
  myParticle[i].show();
  textSize(40);
  fill(#40834D);// draws text withn the program
  text("TO THE SHIP", 200,250);
  text("WE ARE WOODSTOCK",100,400);
  
  }
}
class NormalParticle implements Particle
{ 
  double mySpeed,x,y;
  int myColor,myAngle;

  NormalParticle() {// intailizing values
    x = width/2;
    y = height/2;
    mySpeed = Math.random() * 4;
    myAngle = (int) (Math.PI * 2 * Math.random());
    myColor = (#A8B2A5);
  }
   public void move() {
     x=x+((Math.cos(myAngle))*mySpeed);// all of these will move the paricles on the screen
    y=y+(Math.sin(myAngle)*mySpeed);
    if(y>500)
    {
      x=x-(((Math.cos(myAngle))*mySpeed));
      y=y-((Math.sin(myAngle)*mySpeed));
    }
        if(y<50)
    {
      x=x-(((Math.cos(myAngle))*mySpeed));
      y=y-((Math.sin(myAngle)*mySpeed));
    }
        if(x>500)
    {
      x=x-(((Math.cos(myAngle))*mySpeed));
      y=y-((Math.sin(myAngle)*mySpeed));
    }
        if(x<50)
    {
      x=x-(((Math.cos(myAngle))*mySpeed));
      y=y-((Math.sin(myAngle)*mySpeed));
    }
  }
    
  public void show() {
    fill(myColor);
    ellipse((int) x,(int) y,4,4);
  }
  
}
interface Particle
{
  public void show();// public means it is used by others as well
  public void move();
}
class OddballParticle implements Particle
{
  int x, y;
  double myAngle,mySpeed;// intializing the values
  OddballParticle(){
   x = width/2;
    y = height/2;
    mySpeed = Math.random() * 4;
    myAngle = Math.PI * 2 * Math.random();
  }
   public void move() {
     if (x < mouseX) {   // check if I'm to the left of the mouse
      x = x + (int)(Math.random() * 12) - 2;  // more likely to get a positive number (ie. move to right)
    } 
    else {  // I'm to the right of the mouse
      x = x + (int)(Math.random() * 12) - 8; // more likely to get a negative number (ie. move to the left)
    }
    if (y < mouseY) {   // check if I'm to the left of the mouse
      y = y + (int)(Math.random() * 12) - 2;  // more likely to get a positive number (ie. move to right)
    } 
    else {  // I'm to the right of the mouse
      y = y + (int)(Math.random() * 12) - 8; // more likely to get a negative number (ie. move to the left)
    }
   }
  
  public void show() {// creates the rectangles and elippses 
    fill(#714315);
    ellipse(x,y,50,75);
    fill(255);
    rect(x,y-30,4,50);
    rect(x-10,y,25,4);
    rect(x-10,y +10,25,4);
    rect(x-10,y-10,25,4);
    rect(x-10,y-20,25,4);
  }
   }

void mousePressed() {
  clear();
  for (int i=0; i<myParticle.length; i++) {// a foor loop that runs through the my particle
    myParticle[i]=new NormalParticle();// my particle is a new one each time
  }
  myParticle[0]=new OddballParticle(); //at 0 my particle is an oddball
}
