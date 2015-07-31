// code by Claus Rytter Bruun de Neergaard, March 2011
// (use of PVector learned from Daniel Shiffmann tutorial)

// USER VARIABLES
String memoryToForget="memory.jpg"; 
String newMemory="NothingHereB.jpg";


// GLOBAL VARIABLES ///////////////////////////////
PImage img;// = loadImage(memoryToForget);  
PImage nImg;
float tX=0;
float tY=2;
int currentPixel=0;
int totalPixels=0;
int nPixelsDying=100;//speed
int maxParticles=50000;
int particleRangeMin=0;
int particleRangeMax=1;
float s = 3.0;     // maximum agent velocity 7 by default
float response=0.04; //.15 by default

//int totalPixels=(img.width*img.height)-1;
int pixelCountdown=0;
float sinCounterX=3.14/2; 
float sinCounterY=3.14/2;
Agent[] agents = new Agent[maxParticles];
boolean imageSaved=false;

 
// SETUP //////////////////////////////////////////
 
void setup() {
  img = loadImage(memoryToForget);  
  nImg = loadImage(newMemory);
  currentPixel=(img.width*img.height)-1; 
  totalPixels=currentPixel;
  pixelCountdown=totalPixels;
  size(img.width, img.height);
  noFill();
  stroke(255);
  agents = new Agent[totalPixels];
  for (int i = 0; i < totalPixels; i++) {
    agents[i] = new Agent();
    pixelCountdown--;
  }
  image(img,0,0);
}
 
// DRAW ///////////////////////////////////////////
 
void draw() {
  forget(); 
  if (keyPressed==true){
    delay(30000);
    keyPressed=false;
  }
}
 
