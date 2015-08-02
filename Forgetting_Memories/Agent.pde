// CLASS //////////////////////////////////////////
 
class Agent {

  PVector loc;
  PVector vel;
  PVector acc;
  float speed;
  color c;
  int locY=ceil((pixelCountdown)/width);
  int locX=(width-((locY*width)-(pixelCountdown)))-width;
  Agent() {
    
  loc = new PVector(locX, (locY));
  vel = new PVector(0, 0);
  speed = s;
  }
 
  void update() {
    PVector wave= new PVector((abs(sin(sinCounterX))*random(.3,.9)*width),(abs(sin(sinCounterY))*random(.2,.9)*height));
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc); 
    //sinCounterX=map((noise(tX)*random(.85,.9)),0,1,0 ,width);
    //sinCounterY=map((noise(tY)*random(.85,.9)),0,1,0 ,height);
    //PVector wave= new PVector(sinCounterX,sinCounterY);
    //ellipse(sinCounterX,sinCounterY,10,10);
    //PVector dir = PVector.sub(wave, loc); 
    tX+=.000001;
    tY+=.000001;
    if (tX>10){tX=0;}
    if (tY>13){tY=2;}
    dir.normalize();                       
    dir.mult(response);                        
    acc = dir;                             
 
    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }
   
  void display() {
    point(loc.x, loc.y);
  }
   
}

