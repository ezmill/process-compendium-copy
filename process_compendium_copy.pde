Form1[] forms = new Form1[10];

void setup(){
  size(600,600);
  for (int i = 0; i < forms.length; i++){
    forms[i] = new Form1(60,60);
  }
}

void draw(){
  background(0);
  for(int i = 0; i < forms.length; i++){
    forms[i].display();
    forms[i].b1();
  }
  for(int i = 0; i < forms.length; i++){
    for(int j = 0; j < forms.length; j++){
      forms[i].b3(forms[j]);
    }
  }
}

class Form1{
 float sX,sY;
 boolean touching = false;
 PVector direction, location;
 Form1(float _sX, float _sY){ //circle
   location = new PVector(random(width), random(height));
   sX = _sX;
   sY = _sY;
   speed = 1;
   direction= new PVector(0,sY);
 }
 
 void b1(){ //move in a straight line
   location.add(direction);
 }
 
 void b2(){ //constrain to surface
   if(location.x > width || location.x < 0){
     direction.mult(-1)
   }
 }
 
 void b3(Form1 el){ //change direction while touching another Element
    if ((el.x - this.x) > el.x + this.x){
       touching = true;
    } 
    if(touching){
      direction.add(1);
    }
 }
 
 void b4(){ //move away from an overlapping Element
 
 }
 
 void b5(){ //enter from the opposite edge after moving off the surface
   
 }
 
 void b6(){ //orient toward the direction of an Element that is touching
   
 }
 
 void b7(){ //deviate from the current direction
   
 }
 void display(){
   stroke(255);
   noFill();
   ellipse(x,y,sX,sY);
 }
}
