class SplashScreen
{
  
  int t = 50;
  
  void setup(){
     colorMode(HSB, 100, 100, 100);
    background (HSB, 10, 3, 90); 
  }
  
  void splash() {
    background(0);
    fill(#6f6f6f);
    textFont(font);
    textAlign(CENTER);
    text("press ENTER to begin", width/2, height/2);
    textAlign(LEFT);
    textFont(font1);
    text("click or press 1 for simple curves", t, height-183);
    text("click or press 2 for explading curves", t, height-157);
    text("click or press 3 for _", t, height-133);
    text("click or press S to save a screenshot", t, height-107);
    text("click or press C to clear the canvas", t, height-83);
    text("click or press + or P to make more segments", t, height-57);
    text("click or press - or M to make fewer sections", t, height-33);
    b1.buttonDraw();
    b2.buttonDraw();
    b3.buttonDraw();
    bs.buttonDraw();
    bc.buttonDraw();
    bp.buttonDraw();
    bm.buttonDraw();
    
  }
}