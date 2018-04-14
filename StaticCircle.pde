class StaticCircle { //class is created

  int x; //variables for the x position, y position, height and width of the ellipse
  int y; //are created
  int h;
  int w;
  int col;

  StaticCircle(int _x, int _y, int _col) { //a constructor is created for the static circles
    x = _x-width/2; //mouse x position adjusted for the moving of the sketch plane in the
    y = _y-height/2;  //main sketch
    col = _col;
  }

  void draw() {
    colorMode(RGB,255);
    stroke(col); //the stroke is set to white
    fill(col);  //and so is the fill
    ellipse(x, y, 2, 2);  //the draw function then draws the ellipse when called
  }
}