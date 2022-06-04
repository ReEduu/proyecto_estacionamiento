#include <Servo.h>

int option = 0;
int ledRojo = 3;
int ledVerde = 2;

Servo servo;

void setup()
{
  Serial.begin(9600);
  servo.attach(9);
  pinMode(ledRojo,OUTPUT);
  pinMode(ledVerde,OUTPUT);
  digitalWrite(ledRojo,HIGH);
  digitalWrite(ledVerde,LOW);
  servo.write(0);
}

void loop()
{
  if (Serial.available() > 0) {
    option = Serial.read();
    if(option == 'P'){
      servo.write(180);
        digitalWrite(ledRojo,LOW);
        digitalWrite(ledVerde,HIGH);
        delay(5000);
        servo.write(0);
        digitalWrite(ledRojo,HIGH);
        digitalWrite(ledVerde,LOW);
    }
    
  }
  
}
