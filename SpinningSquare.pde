class SpinningSquare{
  int x;  //vairables for x and y position are creater
  int y;
  int radius;  //variable to radius is created
  int max_size = 75; //max radius of the square is created and set
  int angle;  //variable for angle is also created
  
  // Constructor
  SpinningSquare(int _x, int _y){
    x = _x-width/2;  //mouse x position is adjuested for the sketch plane to be moved
    y = _y-height/2;  //as is the mouse y position
    radius = 0;  //initial radius is set to 0
    angle = 0;  //initial angle is set to 0
  }
  
  void update(){
    radius++;  //ever frame 1 is added to the radius
    angle++;   //and the angle
  }
  
  void draw(){
    noFill(); //fill colour is removed
    int alpha = (int)map(radius%max_size,0,max_size,255,0); //the radius of the square is mapped from 0-150 to 0-255
    stroke(alpha+50,alpha-255, 20, alpha); //then used to create changing colour for the stroke
    rectMode(CENTER); //rectangle is set to the center of the mouse position
    rotate((TAU/360)*radius); //the radius of the circle is then divided by 360 degrees then multiplied by current radius
    rect(x,y,radius%max_size,radius%max_size); // the rectangle is drawn
    
  }
}