// Class created by Pierre Proske  

class Circle{ //class is created
  int x; //variables for x and y position
  int y;
  int radius; //variables for the radius
  int max_size = 150; //maximum size of radius set
  
  // Constructor is created
  Circle(int _x, int _y){
    x = _x-width/2; //mouse x and y position are adjusted to compensate
    y = _y-height/2; // for the sketch plane being translated
    radius = 0;
  }
  
  void update(){
    radius++; //every frame the radius grows by 1
  }
  
  void draw(){
    noFill();
    int alpha = (int)map(radius%max_size,0,max_size,255,0); //the radius of the square is mapped from 0-150 to 0-255
    stroke(alpha,255-alpha, 255, alpha);  //then used to create changing colour for the str
    ellipse(x,y,radius%max_size,radius%max_size); //the ellipse is then drawn 
  }
}