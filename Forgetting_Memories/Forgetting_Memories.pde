// code by Claus Rytter Bruun de Neergaard, March 2011
// (use of PVector learned from Daniel Shiffmann tutorial)

// USER VARIABLES
String memoryToForget="memory2.jpg"; 
String replacementMemory="Replacement.jpg";


// GLOBAL VARIABLES ///////////////////////////////
PImage img;// = loadImage(memoryToForget);  
PImage replacementImage;
float tX=0;
float tY=2;
int currentPixel=0;
int totalPixels=0;
int nPixelsDying=300;//How many pixels are removed at once (speed)
int maxParticles=30000;
int particleRangeMin=0;
int particleRangeMax=1;
int newParticleMin=0;

float s = 7.0;     // maximum agent velocity 7 by default
float response=0.2; //.15 by default

//int totalPixels=(img.width*img.height)-1;
int pixelCountdown=0;
float sinCounterX=3.14/2; 
float sinCounterY=3.14/2;
Agent[] agents = new Agent[maxParticles];
boolean imageSaved=false;

 
// SETUP //////////////////////////////////////////
 
void setup() {
  img = loadImage(memoryToForget);  
  replacementImage = loadImage(replacementMemory);
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
}
 
