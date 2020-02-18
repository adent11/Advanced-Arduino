import processing.serial.*;  //Imports serial library
Serial myPort;

String myStr;  //String read from arduino
int myNum;   //Int value of string from arduino

float nTipX;  //tip of needle X
float nTipY;  //tip of needle Y

float angleDeg;  //angle of needle in degrees
float angleRad;  //angle of needle in radian

int needleLength = 260;  //length of the needle
int tipLength = 12;  //length of the triangle on the tip

int angleDir = 1;
void setup() {
  //font = loadFont("Tahoma-Bold-48.vlw");
  //font = loadFont("PerpetuaTitlingMT-Bold-48.vlw");
  size(800, 800);
  background(255);
  strokeCap(SQUARE);
  fill(25);
  println("Available serial ports:");
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  drawDial();
  getAngle();
}

void drawDial() {
  background(250);
  ellipse(400, 400, 700, 700);
  fill(50);
  stroke(50);
  ellipse(400, 400, 550, 550);
  drawTics(400, 400, 280, 15, -120, 5, 49, 2, 170);
  drawTics(400, 400, 280, 35, -120, 15, 17, 3, 255);
  //drawSmallTics();
  //drawBigTics();
  angleText();
  stroke(25);
  fill(25);
  rect(150, 550, 500, 90);
  rect(250, 600, 300, 100);
  drawNeedle();
  digitalDisplay();
  stroke(25);
  fill(25);
  ellipse(400, 400, 100, 100);
}

void drawNeedle() {
  strokeWeight(10);
  stroke(255, 0, 0);
  nTipX = 400 + (needleLength*sin(angleRad));
  nTipY = 400 - (needleLength*cos(angleRad));
  line(400, 400, nTipX, nTipY);
}

void calcAngle() {
  if (keyPressed) {
  if (keyCode == 39 && angleDeg < 120) {
    angleDeg = angleDeg + 1;
  }
  if (keyCode == 37 && angleDeg > -120) {
    angleDeg = angleDeg - 1;
  }
  }
  angleRad = radians(angleDeg);
}

void calcAngle2() {
  if (angleDeg > 120) {
  angleDir = -1;
  delay(150);
  }
  if (angleDeg < -120) {
  angleDir = 1;
  delay(150);
  }
  angleDeg = angleDeg + angleDir;
  angleRad = radians(angleDeg);
  //delay(30);
}

void getAngle() {
  if ( myPort.available() > 0)
  {
  myStr = myPort.readStringUntil('\n');
  if (myStr != null)
  {
    myStr = myStr.trim();
    //myNum = Integer.parseInt(myStr);
    myNum = int(myStr);
    angleDeg = float(int(map(myNum, 0, 1023, -120, 120)));
    angleRad = radians(angleDeg);
    // lots more code here...
  }
  }
}

void digitalDisplay() {
  fill(75);
  stroke(75);
  rect(310, 595, 180, 50);
  textAlign(RIGHT);
  textSize(60);
  fill(0);
  String text = str(int(angleDeg));
  text = text + "°";
  //text(text, 400, 643); if center alligned
  text(text, 480, 643);
}

void drawTics(int centerX, int centerY, int distance, int ticLength, float angle, float angleIncrement, int ticNumber, int weight, color ticColor ) {
  float x1, y1, x2, y2;
  int farDistance = distance + ticLength;
  strokeWeight(weight);
  stroke(ticColor);
  for (int i = 0; i < ticNumber; i++) {
  x1 = centerX + (distance*sin(radians(angle)));
  y1 = centerY - (distance*cos(radians(angle)));
  x2 = centerX + (farDistance*sin(radians(angle)));
  y2 = centerY - (farDistance*cos(radians(angle)));
  line(x1, y1, x2, y2);
  angle = angle + angleIncrement;
  }
}

void angleText() {
  int angle = -120;
  translate(400, 400);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  for (int i = 0; i < 17; i++) {
  rotate(radians(angle));
  String text = int(angle) + "°";
  text(text, 0, -330);
  rotate(radians(-angle));
  angle = angle + 15;
  }
  translate(-400, -400);
}
