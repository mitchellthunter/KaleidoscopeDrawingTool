//-----here all the classes are defined-----
SplashScreen ss;
Button b1; 
Button b2;
Button b3;
Button bs;
Button bc;
Button bp;
Button bm;

int slices = 8; //this variable controls how many time the drawing is repeated
int pattern = 1; //this variavble controls which drawing tool is being used
long grad;

//-----here all the arraylists for all the sketches are created-----
ArrayList<Circle> circles = new ArrayList<Circle>();
ArrayList <StaticCircle> curves = new ArrayList<StaticCircle>();
ArrayList<SpinningSquare> square = new ArrayList<SpinningSquare>();
ArrayList<CustomBrush> stars = new ArrayList<CustomBrush>();

boolean start = false; //a boolean is defined to start the sketch

//-----here the custom fonts are defined-----
PFont font;
PFont font1;
PFont font2;

int Y_AXIS = 1;
int X_AXIS = 2;
color d1, d2;
int col = #ffffff;


PImage img; //here a custom image is defined

void setup() {
  //size(600,600,P3D);
fullScreen(P3D); //setting the sketch resolution to fullscreen
  colorMode(HSB, 100, 100, 100); //changes the colour to Hue, Saturation and Brightness
  background (0); //setting the background as black


  img = loadImage("Star.png"); //here the custom image is loaded from the data folder

  font = createFont("GeosansLight", 22); //here three instances of a custom font are created
  font1 = createFont("GeosansLight", 15);
  font2 = createFont("GeosansLight", 10);

  d1 = color(#ffffff);
  d2 = color(#000000);

  ss = new SplashScreen(); //the Welcome screen is setup so it can be called
  b1 = new Button(30, height-195, #151515, '1'); //here all the buttons are defined
  b2 = new Button(30, height-170, #151515, '2'); //the variables are the starting point in the x axis,
  b3 = new Button(30, height-145, #151515, '3'); //followed by the startingn point in the y axis,
  bs = new Button(30, height-120, #151515, 'S'); // then the colour of the button,
  bc = new Button(30, height-95, #151515, 'C');  // then finally a letter identifier
  bp = new Button(30, height-70, #151515, 'P');
  bm = new Button(30, height-45, #151515, 'M');
}

void draw() {

  if (start == false) { // here the if statement checks if the sketch has been initialised, as it hasnt been the splash screen is loaded
    ss.splash();
  } else if (start == true) { //once ENTER has been pressed the  start main sketch is started and the buttons are drawn
    background (0);
    b1.buttonDraw();
    b2.buttonDraw();
    b3.buttonDraw();
    bs.buttonDraw();
    bc.buttonDraw();
    bp.buttonDraw();
    bm.buttonDraw();

    // check if the mouse is hovering over buttons---------------
    b1.checkClick();
    b2.checkClick();
    b3.checkClick();
    bs.checkClick();
    bc.checkClick();
    bp.checkClick();
    bm.checkClick();

    pattern1(); //each of the drawing tools are called
    pattern2();
    pattern3();
    pattern4();

    if (pattern == 1) {
      setGradient(65, height-195, 15, 160, d1, d2, Y_AXIS);
      stroke(#151515);
      noFill();
      rect(65, height-195, 15, 165);
    }
  }
}

void mousePressed() {

  if (b1.selected == true) { //clicking on the button changes to pattern 1
    pattern = 1;
  }
  if (pattern == 1) {
    if (mouseX >= 65 && mouseX < 80 &&
      mouseY >= height-195 && mouseY < height-35) {
      int alpha = (int)map(grad, 0, 160, 255, 0);
      col = ((height-195)-mouseY)+alpha;
      println(col);
    }
  }
  if (pattern == 4) { //clicking on the button changes to pattern 1
     stars.add(new CustomBrush(mouseX, mouseY));
  }
  if (b2.selected == true) { //clicking on the button changes to pattern 2
    pattern = 2;
  }
  if (b3.selected == true) { //clicking on the button changes to pattern 3
    pattern = 3;
  }
  if (bs.selected == true) {  //clicking on the save button saves an image
    saveFrame("line-######.png");
  }
  if (bc.selected == true) { //clears all the data currently on screen
    circles.clear();
    background(0);
  }
  if (bp.selected == true) { //increases the number of slices
    slices++;
  }
  if (bm.selected == true) { //decreases the number of slices
    slices--;
  }
}

void mouseDragged() {
  if (pattern == 1) { //if the mouse is dragged and pattern one is selected a new curve is added to the array
    curves.add(new StaticCircle(mouseX, mouseY, col));
  }
  if (pattern == 2) { //if the mouse is dragged and pattern two is selected a new circle is added to the array
    circles.add(new Circle(mouseX, mouseY));
  }
  if (pattern == 3) { //if the mouse is dragged and pattern one is selected a new square is added to the array
    square.add(new SpinningSquare(mouseX, mouseY));
  }
}
void keyPressed() {
  if (key == ENTER) {  //transitions from splash screen to main drawing
    start = true;
  }
  if (key=='s'||key=='S') { // Saves a screenshot of current screen
    saveFrame("line-######.png");
  }
  if (key=='c'||key=='C') { //Clears all the data from the arrays on screen
    circles.clear();
    curves.clear();
    square.clear();
    stars.clear();
  }
  if (key=='1') { // Changes pattern to 1
    pattern = 1;
  }
  if (key=='2') { // Changes pattern to 2
    pattern = 2;
  }
  if (key=='3') { // Changes pattern to 3
    pattern = 3;
  }
  if (key=='4') { // Changes pattern to 4    
    pattern = 4;
  }
  if (key=='-') { // Increases the number of slices in the drawing
    slices--;
  }
  if (key=='+') { // Decreases the number of slices in the drawing    
    slices++;
  }
}

void pattern1() {
  for (int j = 0; j < curves.size(); j++) {  //here the array is defined
    StaticCircle staticcircle = curves.get(j);
    for (int i = 0; i<slices; i++) {
      pushMatrix(); //here the sketch plane is released
      translate(width/2, height/2); //and moved so that 0,0 is now in the center of the screen
      rotate(radians(i*360/slices)); //the for loop then divides a full rotation in to the amount of and copys the curve around for each segment

      staticcircle.draw(); //here the sketch is drawn
      popMatrix(); //and the sketch planeis put back into place ready for the next step of the loop
    }
  }
}


void pattern2() { //here the same thing is completed but for the 2nd pattern
  for (int j = 0; j < circles.size(); j++) {
    Circle circle = circles.get(j);
    circle.update();

    for (int i = 0; i<slices; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*360/slices));

      circle.draw();
      popMatrix();
    }
  }
}

void pattern3() { //here the same thing is completed but for the 3rd pattern
  for (int j = 0; j < square.size(); j++) {
    SpinningSquare spinningsquare = square.get(j);
    spinningsquare.update();

    for (int i = 0; i<slices; i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*360/slices));

      spinningsquare.draw();
      popMatrix();
    }
  }
}

void pattern4() { //here the same thing is completed but for the 4th sketch
  for (int j = 0; j < stars.size(); j++) {
    CustomBrush custombrush = stars.get(j);
    for (int i = 0; i<100; i++) {

      custombrush.draw();
    }
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}