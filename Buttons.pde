class Button {
  int x, y;   //variables are created
  int buttonW = 15;
  int buttonH = 15;
  color colour;
  boolean selected = false;
  char button;

  //create a constructor for button positioning, colour and identifier//
  Button(int _x, int _y, color _colour, char _button)
  {
    x = _x;
    y = _y;
    colour = _colour;
    button = _button;
  }

  void checkClick() {
    //Here its checking if the mouse is inside the button
    if (mouseX >= x && mouseX < x+buttonW &&
      mouseY >= y && mouseY < y+buttonH) {  //if the mouse is within these parameters
      stroke(colour); //the square is highlighted
      selected = true; //then the boolean is true
    } else {
      selected = false; //otherwise the boolean is false
    }
  }

  void buttonDraw() {
    //Customisating the buttons
    fill(colour); //selecting the button colour
    if (selected) {
      stroke(#c3c3c3); //creating a special outline if the mouse is on the button
      fill(#c3c3c3); //creating the colour for the text 
      text(button, x+20, y+12); //creating the location for the text
      fill(#000000); //to keep the inside of the box dark
    } else {
      stroke(colour); //if the button isnt moused over keep he outline the same color as the box
    }
    rect(x, y, buttonW, buttonH); //create the button
  }
  boolean overButton(int x, int y, int buttonW, int buttonH) { //here a boolean is created in a similar way
    if (mouseX >= x && mouseX <= x+buttonW &&                   //to the mouse over function
      mouseY >= y && mouseY <= y+buttonH) {                     //so that the button can create a desired action
      return true;
    } else {
      return false;
    }
  }
}