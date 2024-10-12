
// This code is for the ultrasonic sensor to rotate 180 degrees and measure the distance at each angle.
#include <Servo.h> 
Servo myServo; 
int trigPin = 10;
int echoPin = 11;
long duration;
int distance;

void setup() {
  Serial.begin(9600);
  myServo.attach(12); 
  pinMode(trigPin, OUTPUT); 
  pinMode(echoPin, INPUT); 
}

void loop() {
 print_serial();
}
void print_serial(){
  for(int i=165;i>15;i--){  
  myServo.write(i);
  delay(30);
  distance = measures_the_distance();
  Serial.print(i);
  Serial.print(",");
  Serial.print(distance);
  Serial.print(".");
  }
  for(int i=15;i<=165;i++){  
  myServo.write(i);
  delay(30);
  distance = measures_the_distance();
  Serial.print(i); 
  Serial.print(","); 
  Serial.print(distance); 
  Serial.print("."); 
  }
}
int measures_the_distance(){ 
  digitalWrite(trigPin, LOW); 
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH); 
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH); 
  distance= duration*0.034/2;
  return distance;
}