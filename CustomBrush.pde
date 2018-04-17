class CustomBrush {  //custom brush class created

  int x;  //variables for x and y positions
  int y;
  int h;  // height and width are created
  int w;


  CustomBrush(int _x, int _y) { //a constructor is created

    x = _x; //x mouse position is set
    y = height-300; //the brush is automatically moved to the bottom edge
  }
  void draw() {
    image(img, x, y, 300, 300); //custom .png brush is drawn
  }
}