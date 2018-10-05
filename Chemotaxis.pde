//declare bacteria variables here   
 Bacteria original;
 int randomWalk = (int)(Math.random()*4)+1;
 void setup()   
 {     
   //initialize bacteria variables here 

 size(500,500);
 //background(0);
 frameRate(100);
 original = new Bacteria();
 }   
 void draw()   
 {    
   //move and show the bacteria   //60% chance to not change direction?
   background(0);
   rect(50,25,5,475);
   rect(100,25,5,475);
   rect(150,25,5,475);
   rect(200,25,5,475);
   rect(250,25,5,475);
   rect(300,25,5,475);
   rect(350,25,5,475);
   rect(400,25,5,475);
   rect(450,25,5,475);
   //original = new Bacteria();
   original.walk();
   original.show();
 }  
 class Bacteria    
 {     
   int myX, myY;
  Bacteria(){
  myX = 250;
  myY = 250;

 }
 void walk(){
   if(myX < 0){
     myX = myX + 2;
   }else if(myX > 500){
     myX = myX - 2;
   }
   if(myY < 0){
     myY = myY + 2;
   }else if(myY > 500){
     myY = myY - 2;
   }
   if(myX % 25 == 0 && myY % 25 == 0){
     randomWalk = (int)(Math.random()*4)+1;
   }
   if(randomWalk == 1){
     myX = myX + 2;
   }else if(randomWalk == 2){
     myX = myX - 2;
   }else if(randomWalk == 3){
     myY = myY + 2;
   }else if(randomWalk == 4){
     myY = myY - 2;
   }else{
     println(randomWalk);
   }
   //if(myX > 0){
   //  myX = myX + 2;
   //}else if(myX < 500){
   //  myX = myX - 2;
   //}
   //if(myY > 0){
   //  myY = myY + 2;
   //}else if(myX < 500){
   //  myY = myY - 2;
   //}
 }
 void show(){
   fill(255);
   ellipse(myX, myY, 50, 50);
 }
 }