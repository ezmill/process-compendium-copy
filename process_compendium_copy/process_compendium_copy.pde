Form1[] forms = new Form1[10];

void setup(){
  size(600,600);
  for (int i = 0; i < forms.length; i++){
    forms[i] = new Form1(100,100);
  }
}
void draw(){
  background(0);
  for(int i = 0; i < forms.length; i++){
    forms[i].display();
    forms[i].b1();
    forms[i].b2();
  }
  for(int i = 0; i < forms.length; i++){
    for(int j = 1; j < forms.length; j++){
      if(forms[i].intersect(forms[j])){
        forms[i].b3();
        //forms[j].b3();
      }
    }
  }
}

class Form1{
 float sX,sY;
 boolean touching = false;
 PVector direction, location;
 float angle;
 color c;
 Form1(float _sX, float _sY){ //circle
   location = new PVector(random(width), random(height));
   sX = _sX;
   sY = _sY;
   direction= new PVector(random(-1,1),random(-1,1));
   angle = 1;
   c = color(255,255,255);
 }
 
 void b1(){ //move in a straight line
   location.add(direction);
 }
 
 void b2(){ //constrain to surface
  if ((location.x > width) || (location.x < 0)) {
    direction.x *=-1;
  }
  if ((location.y > height) || (location.y < 0)) {
    direction.y *=-1;
  }
 }
 
 void b3(){ //change direction while touching another Element
      this.c = color(255,0,0);
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
   stroke(c);
   noFill();
rect(location.x, location.y,sX,sY);
   
 }
 
 boolean intersect(Form1 el) {
    
    // Objects can be passed into functions as arguments too! 
    float distance = dist(location.x,location.y,el.location.x,el.location.y); // Calculate distance
    
    // Compare distance to sum of radii
    if (distance < sX + el.sX) {
      return true;
    } else {
      return false;
    }
  }

}
