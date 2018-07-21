int i=0;
int a;
float X1,Y1,x,y,X,Y,x3,y3;
float a1=PI;
float x1,y1,x2,y2,x4,y4;
float seglength1=75;//size index finger
float angle5=0;
int flag=0;
float l1=50;//Widhth lower
float l2=175;//Height
float l3=75;//width upper
float l5=10;//thickness param
Finger f1=new Finger();//Small
Finger f2=new Finger();//Ring
Finger f3=new Finger();//Middle
Finger f4=new Finger();//Index
Finger f5=new Finger();//thumb
PVector v1= new PVector(X1,Y1,0);
float q1a[]={0.00,1.00,0.00,0.00};
public class Finger{
public float x,y,z,segLength,angle3,thickness;
public void setValue(float x1,float y1,float seg1,float ang,float t){
  x=x1;
  y=y1;
  segLength=seg1;
  angle3=ang;
  thickness=t;

}
public void move()
{

  
  float angle1 = (mouseX/float(width) - 0.5) * -PI;
  float angle2 = (mouseY/float(height) - 0.5) * PI;
  
  pushMatrix();
  segment(x, y, angle1,segLength,angle3,1,thickness); 
  segment(0, segLength, angle2,segLength,angle3,0,thickness);
  popMatrix();

}
public void movej1()
{

  
  float angle1 = (mouseX/float(width) - 0.5) * -PI;
  float angle2 = (mouseY/float(height) - 0.5) * PI;
  
  pushMatrix();
  segment(x, y, angle1,segLength*2,angle3,1,thickness); 
 // segment(0, segLength, angle2,segLength,angle3,0);
  popMatrix();

}
public void movej2()
{

  
  float angle1 = (mouseX/float(width) - 0.5) * -PI;
  float angle2 = (mouseY/float(height) - 0.5) * PI;
  
  pushMatrix();
  segment(x, y, 0,segLength,angle3,1,thickness); 
  segment(0, segLength, angle2,segLength,angle3,0,thickness);
  popMatrix();

}
public void static1(){
  
  pushMatrix();
  segment(x, y, 0,segLength,angle3,1,thickness); 
  segment(0, segLength, 0,segLength,angle3,0,thickness);
  popMatrix();

}}
void setup()
{
 size(1000,1000,P3D);
 background(0);
 stroke(255);
 strokeWeight(5);
 stroke(255,218,185);
 fill(255,218,185);
 X1=-35;
 Y1=l2/2;
 x =X1-l1;//Index
 y =Y1-l2;
 X=X1+l3;
 Y=Y1;
 x3=X+l1;//small finger
 y3=Y1-l2;

float l4=(2*l1+l3)/3;
  x1=x+l4;//middle finger
  y1=Y1-l2;
  x2=x+2*l4;//ring
  y2=Y1-l2;
  x4=X1;//Thumb
  y4=Y1;
  f1.setValue(x3,y3,seglength1*0.5,a1+2*PI/16,15);
  f2.setValue(x2+l5,y2,seglength1,a1+PI/20,15);
  f3.setValue(x1+l5,y1,seglength1*10/8,a1,15);
  f4.setValue(x+l5,y,seglength1*.94,a1-2*PI/20.0,15);
  f5.setValue(x4+2*l5,y4-l5,seglength1,a1-5*PI/16.0,25);

}
void draw() {
 background(0);
i=0;
translate(500,500);

/*noFill();
quad(x,y,x3,y3,X,Y,X1,Y1);*/
wrist();
}
void segment(float x, float y, float a,float seglength,float angl,int a1,float t) {
  translate(x, y);
  if(a1==1)
  rotate(angl);
  rotateX(a);
  //line(0, 0, 0, seglength);
  rect(0,0,t,seglength,10);
  }
void wrist()
{
if(flag!=1)
{
angle5 = (mouseX/float(width) - 0.5) * -PI;
flag=0;
f1.static1();
f2.static1();
f3.static1();
f4.static1();
f5.static1();
}
if(mousePressed==true)
{
 flag=1;
f1.move();
f2.move();
f3.move();
f4.move();
f5.move();
}
else
flag=0;
//noFill();
strokeWeight(20);
quad(x,y,x3,y3,X,Y,X1,Y1);
strokeWeight(5);
//println(angle5);
}
