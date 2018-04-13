class StaticCircle { //class is created

  int x; //variables for the x position, y position, height and width of the ellipse
  int y; //are created
  int h;
  int w;


  StaticCircle(int _x, int _y) { //a constructor is created for the static circles
    x = _x-width/2; //mouse x position adjusted for the moving of the sketch plane in the
    y = _y-height/2;  //main sketch
  }

  void draw() {
    stroke(#FFFFFF); //the stroke is set to white
    fill(#FFFFFF);  //and so is the fill
    ellipse(x, y, 2, 2);  //the draw function then draws the ellipse when called
  }
}