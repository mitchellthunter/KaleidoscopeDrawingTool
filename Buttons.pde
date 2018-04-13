class Button {
  int x, y;
  int buttonW = 15;
  int buttonH = 15;
  color colour;
  boolean selected = false;
  char button;
  
  //Button Positioning and Colour//
  Button(int _x, int _y, color _colour, char _button)
  {
    x = _x;
    y = _y;
    colour = _colour;
    button = _button;
  }

  void checkClick() {
    //Button Outlined if Clicked inside Button Parameters//
    if (mouseX >= x && mouseX < x+buttonW &&
      mouseY >= y && mouseY < y+buttonH) {
      stroke(colour);
      selected = true;
    } else {
      selected = false;
    }
  }

  void buttonDraw() {
    //Button Customisation//
    fill(colour);
    if (selected) {
      stroke(#c3c3c3);
      fill(#c3c3c3);
      text(button, x+20, y+12);
      fill(#000000);
    } else {
      stroke(colour);
      
    }
    //Render Button//
    rect(x, y, buttonW, buttonH);
  }
boolean overButton(int x, int y, int buttonW, int buttonH) {
  if (mouseX >= x && mouseX <= x+buttonW && 
    mouseY >= y && mouseY <= y+buttonH) {
    return true;
  } else {
    return false;
  }
}
}