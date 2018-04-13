class SpinningSquare{
  int x;
  int y;
  int radius;
  int max_size = 75;
  int angle;
  
  // Constructor
  SpinningSquare(int _x, int _y){
    x = _x-width/2;
    y = _y-height/2;
    radius = 0;
    angle = 0;
  }
  
  void update(){
    radius++;
    angle++;
  }
  
  void draw(){
    noFill();
    int alpha = (int)map(radius%max_size,0,max_size,255,0);
    stroke(alpha+50,alpha-255, 20, alpha);
    rectMode(CENTER);
    rotate((TAU/360)*radius);
    rect(x,y,radius%max_size,radius%max_size);
    
  }
}