import processing.serial.*; 
import java.awt.event.KeyEvent; 
import java.io.IOException;
Serial myPort;
String angle="";
String distance="";
String data="";
String noObject;
float pixsDistance;
int iAngle, iDistance;
int index1=0;
int index2=0;
PFont orcFont;

void setup() {
 size (1900,1200);
 smooth();
 myPort = new Serial(this,"COM6", 9600); 
 myPort.bufferUntil('.'); 
}

void draw() {
  
  fill(98,245,31);
  noStroke();
  fill(0,4); 
  rect(0, 0, width, 1010); 
  
  drawRadar(); 
  drawLine();
  drawObject();
  drawText();
}

void serialEvent (Serial myPort) { 
  data = myPort.readStringUntil('.');
  data = data.substring(0,data.length()-1);
  
  index1 = data.indexOf(","); 
  angle= data.substring(0, index1);
  distance= data.substring(index1+1, data.length()); 
  
  iAngle = int(angle);
  iDistance = int(distance);
}

void drawRadar() {
  pushMatrix();
  translate(700,700); 
  noFill();
  strokeWeight(2);
  stroke(255,245,255);
  // draws the arc lines
  arc(0,0,1800,1800,PI,TWO_PI);
  arc(0,0,1400,1400,PI,TWO_PI);
  arc(0,0,1000,1000,PI,TWO_PI);
  arc(0,0,600,600,PI,TWO_PI);
 
  line(-960,0,960,0);
  line(0,0,-960*cos(radians(30)),-960*sin(radians(30)));
  line(0,0,-960*cos(radians(60)),-960*sin(radians(60)));
  line(0,0,-960*cos(radians(90)),-960*sin(radians(90)));
  line(0,0,-960*cos(radians(120)),-960*sin(radians(120)));
  line(0,0,-960*cos(radians(150)),-960*sin(radians(150)));
  line(-960*cos(radians(30)),0,960,0);
  popMatrix();
}
void drawObject() {
  pushMatrix();
  translate(700,700);
  strokeWeight(9);
  stroke(255,0,0); 
  pixsDistance = iDistance*22.5;
  if(iDistance<40)
     line(pixsDistance*cos(radians(iAngle)),-pixsDistance*sin(radians(iAngle)),950*cos(radians(iAngle)),-950*sin(radians(iAngle)));
  popMatrix();
}
void drawLine() {
  pushMatrix();
  strokeWeight(9);
  stroke(30,10,250);
  translate(700,700); 
  line(0,0,950*cos(radians(iAngle)),-950*sin(radians(iAngle))); 
  popMatrix();
}

void drawText() {
  
  pushMatrix();
  fill(0,0,0);
  noStroke();
  rect(0, 1010, width, 600);
  textSize(25);
  fill(255,255,255);
  translate(800,650);
  rotate(-radians(-60));
  text("30°",0,0);
  resetMatrix();
  translate(740,600);
  rotate(-radians(-30));
  text("60°",0,0);
  resetMatrix();
  translate(680,590);
  rotate(radians(0));
  text("90°",0,0);
  resetMatrix();
  translate(620,620);
  rotate(radians(-30));
  text("120°",0,0);
  resetMatrix();
  translate(590,680);
  rotate(radians(-60));
  text("150°",0,0);
resetMatrix();
  translate(50,650);
  rotate(radians(0));
  fill(5,0,0);
  text("PoliArdo team Serbia",2,5);
    fill(255,255,255);
  text("PoliArdo team Serbia",0,0);
  popMatrix(); 
}