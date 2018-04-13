class StaticCircle {

  int x;
  int y;
  int h;
  int w;
  int max_size = 150;
  int radius;

  StaticCircle(int _x, int _y) {
    x = _x-width/2;
    y = _y-height/2;
    radius = 0;
  }

  void draw() {
    //int alpha = (int)map(radius%max_size,0,max_size,255,0);
    //stroke(alpha,255-alpha, 255, alpha);
    stroke(#FFFFFF);
    fill(#FFFFFF);
    ellipse(x, y, 2, 2);
  }
}