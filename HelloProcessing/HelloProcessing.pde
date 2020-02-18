int x = 50;
int xDirection = 5;
int y = 155;
int yDirection = 5;
void setup() {
size(300, 300);
background(0, 0, 50);
}

void draw() {
if(x > 255){
  xDirection = -5;
}
else if(x < 50){
  xDirection = 5;
}
x = x + xDirection;

if(y > 255){
  yDirection = -5;
}
else if(y < 50){
  yDirection = 5;
}
y = y + yDirection;

ellipse(x, y, 100, 100);
fill(255, 0, 0);
println("Hello world.");
}
