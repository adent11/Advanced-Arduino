import processing.serial.*;
Serial myPort;

int servoAngle;

boolean sliderClicked = false;
int sliderPos = 25;
int shading;

void setup() {
  size(300, 450);
  println("Available serial ports:");
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}
void draw() {
  background(255);
  slider();
  myPort.write(servoAngle);
  //myPort.write("/");
  println(servoAngle);
  delay(100);
  //angle = int(map(mouseX, 0, 300, 90, 270));
  servoBody();
  servoArm();
}

void slider() {
  stroke(230);
  fill(230);
  rect(25, 45, 250, 10);

  if (mousePressed) {
    if (abs(mouseX - sliderPos) < 8  && abs(mouseY-50) < 25) {
      sliderClicked = true;
    }
    if (abs(mouseX - 150) < 125 && abs(mouseY-50) < 5) {
      sliderClicked  = true;
    }
  } else if (mousePressed == false) {
    sliderClicked = false;
  }

  if (sliderClicked) {
    sliderPos = constrain(mouseX, 25, 275);
  }
  if (sliderClicked) {
    shading = 120;
  } else if ((abs(mouseX - sliderPos) < 8  && abs(mouseY-50) < 25) || (abs(mouseX - 150) < 125 && abs(mouseY-50) < 5)) {
    shading = 160;
  } else {
    shading = 180;
  }
  stroke(30);
  fill(shading);
  rect(sliderPos-8, 25, 16, 50);
  servoAngle = int(map(sliderPos, 25, 275, 0, 180));
}

void servoBody() {
  fill(48, 128, 227);
  stroke(48, 128, 227);
  rect(90, 175, 120, 270, 30);
}

void servoArm() {
  translate(150, 240);
  rotate(radians(servoAngle+90));
  fill(200);
  stroke(200);
  ellipse(0, 0, 50, 50);
  beginShape();
  vertex(-25, 0);
  vertex(25, 0);
  vertex(10, 120);
  vertex(-10, 120);
  endShape(CLOSE);
  ellipse(0, 120, 20, 20);
  rotate(radians(-servoAngle+90));
  translate(-150, -240);
}
