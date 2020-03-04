int x = 50;
int xDirection = 5;
int y = 155;
int yDirection = 5;
void setup() {
  size(300, 300);
  background(0, 0, 50);
  textAlign(CENTER);
}

void draw() {
  background(random(0, 255), random(0, 255), random(0, 255));
  if (x > 255) {
    xDirection = -int(random(0,5));
  } else if (x < 50) {
    xDirection = int(random(0,5));
  }
  x = x + xDirection;

  if (y > 255) {
    yDirection = -int(random(0,5));
  } else if (y < 50) {
    yDirection = int(random(0,5));
  }
  y = y + yDirection;

  ellipse(x, y, 100, 100);
  fill(random(0, 255), random(0, 255), random(0, 255));
  stroke(random(0, 255), random(0, 255), random(0, 255));
  strokeWeight(random(0, 10));
  textSize(random(10, 30));
  text("Hello world.", 150, 150);
}
