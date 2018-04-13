class CustomBrush {

  int x;
  int y;
  int h;
  int w;


  CustomBrush(int _x, int _y) {

    x = _x;
    y = height-300;
  }
  void draw() {
    image(img, x, height-50, 50, 50);
  }
}