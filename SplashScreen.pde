class SplashScreen
{
  
  int t = 50; //a vaiable is created to we the text should start on the x axis
  
  void splash() {
    background(0); //background is seet to black
    fill(#6f6f6f); // the colour of the text
    textFont(font); //the custom font is chosen
    textAlign(CENTER); //and aligned to the center for the header
    text("press ENTER to begin", width/2, height/2); //text is input followed by its x and y position
    textAlign(LEFT); //text alignment is changed to left
    textFont(font1); //and the second fond is chosen
    text("click or press 1 for simple curves", t, height-183); //as before the text is chosen
    text("click or press 2 for explading curves", t, height-157); //and so is its x and y position
    text("click or press 3 for spinning squares", t, height-133);
    text("click or press S to save a screenshot", t, height-107);
    text("click or press C to clear the canvas", t, height-83);
    text("click or press + or P to make more segments", t, height-57);
    text("click or press - or M to make fewer sections", t, height-33);
    b1.buttonDraw();
    b2.buttonDraw();  //buttons are drawn for illustrative purposes
    b3.buttonDraw();
    bs.buttonDraw();
    bc.buttonDraw();
    bp.buttonDraw();
    bm.buttonDraw();
    
  }
}