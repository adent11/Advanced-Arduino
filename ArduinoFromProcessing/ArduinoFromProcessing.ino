#include <LiquidCrystal_I2C.h>
#include <Servo.h>
Servo myServo;

String readStr;
int servoPos = 0;

LiquidCrystal_I2C lcd(0x27, 16, 2);

void setup() {
  // put your setup code here, to run once:
  lcd.init();
  lcd.backlight();
  lcd.print("hello");
  Serial.begin(9600);
  myServo.attach(8);
  myServo.write(180);
  delay(1000);
  myServo.write(0);
  delay(1000);
  lcd.clear();
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available()) {
    //readStr  = Serial.readStringUntil(/);
    servoPos = Serial.read();
    lcd.clear();

    myServo.write(servoPos);    
    delay(10);
  }
  lcd.clear();
  lcd.print(servoPos);
}
