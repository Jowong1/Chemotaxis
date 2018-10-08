//declare bacteria variables here   
 Bacteria original;
 Bacteria top;
 // float a=0.0; 
 boolean reboot = false;
 int randomWalk = (int)(Math.random()*4)+1;
 int shift = 2;
 int num = 5;//(int)(Math.random()*10);
 int bubbleColor = color(255, 255 , 255);
 int grayColor = color(174, 180, 191);
 boolean correctNumber = false;
 boolean changemyY = false;
 int shiftY = 0;
 boolean secondRow = false;
 boolean thirdRow = false;
 int widthX = 40;
 int heightY = 40;
 boolean hitBottom = false;
 boolean hitBottomSecond = false;
 int blockY = 50;
 boolean rightSquish = false;
 boolean leftSquish = false;
 boolean squishBall = false;
 boolean squishBallSecond = false;
 int myXFirst = -1;
 int shiftmyXFirst = 1;
 int myXSecond = -1;
 int shiftmyXSecond = 1;
 int tipperY = 100;
 int tipperYshift = 2;
 boolean rollDown = false;
 boolean cueCrusher = false;
 int crusherX = 500;
 int crusherShift = -1;
 boolean crushEm = false;
 void setup()   
 {     
   //initialize bacteria variables here 

 size(500,500);
 //background(0);
 frameRate(100);
 // textMode(CENTER);
 //original = new Bacteria();
 top = new Bacteria();
 }   
 void draw()   
 {    
   //move and show the bacteria   //60% chance to not change direction?
   background(0);
   rect(25,50,400,5);
   rect(25,100,450,5);
   rect(25,150,450,5);
   rect(25,200,450,5);
   rect(25,250,450,5);
   rect(25,300,450,5);
   rect(25,350,450,5);
   rect(25,400,450,5);
   rect(25,400,450,5);
   //original.walk();
   //original.show();
   if(thirdRow == true){
     top.runCheckSecondRow();
   }
   top.run();
   top.runCheck();
   top.show();
   top.numberGenerator();
   topRowDispenser();
   
   if(secondRow == true){
     frameRate(70);
     shift = -1;
     top.run();
     top.reshape();
     top.arenaSquisher();
   }
   if(thirdRow == true){
     top.crusher();
   }
   
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
 }
 void run(){
   myX = myX + shift;
   if(myX < 50 && reboot == false){
     shift = 2;
   }else if(myX > 460 && reboot == false){
     shift = -2;
   }else if(reboot == true){
     shift = 1;
   }
 }
 void runCheck(){
   if(correctNumber == true && myX >= 460){
     changemyY = true; //Function: myY = 80;
     bubbleColor = color(0, 255, 0);
   }else if(changemyY == true){
     myY = myY + shiftY;
     if(myY < 80 && secondRow == false){
       shiftY = 2;
       shift = 0;
     }else{
       shiftY = 0;
     }
     if(myY == 80){
       secondRow = true;
     }
     bubbleColor = color(0, 255, 0);
   }else{
   myY = 30;
   }
 }
 void runCheckSecondRow(){
   if(thirdRow == true){
    fill(0);
    rect(25,100, 75, 6);
    fill(grayColor);
    beginShape(); // Second row tipper
    vertex(25,100);
    vertex(75,tipperY);
    vertex(75,tipperY + 6);
    vertex(25,106);
    endShape(CLOSE);
    //frameRate(20);
    tipperY = tipperY + tipperYshift;
    if(tipperY < 100){
      tipperYshift = 2;
    }else if(tipperY > 147.5){
      tipperYshift = 0;
    }
    myY = myY + shiftY;
    if(myY < 114){
      shiftY = 1;
      rollDown = true;
    }else{
      shiftY = 0;
    }
    if(rollDown == true){
      shiftY = 2;
      shift = 1;
      if(myY == 130){
        shiftY = 0;
        shift = 3;
      }
      if(myX >= 432.5){
        shift = 0;
        shiftY = 0;
        cueCrusher = true;
      }
    }
   }
 }
   void crusher(){
    if(cueCrusher == true){
      fill(100);
      rect(crusherX, 160, 50, 40);
      triangle(crusherX, 150, crusherX + 50, 150, crusherX + 25, 170);
      crusherX = crusherX + crusherShift;
      if(crusherX > 410){
        crusherShift = -2;
      }
      if(crusherX <= 410){
        crusherShift = 0;
        crushEm = true;
      }
    }
    if(crushEm == true){
      shiftY = 1;
      if(myY == 180){
        shiftY = 0;
      }
    }
    fill(grayColor);
   }
 void numberGenerator(){
   fill(0);
   if(myX == 60){
     num = 5;//(int)(Math.random()*10);
   }
   text(num, myX-4, myY+5);
   // pushMatrix();
   // fill(255);
   // translate(width/2, height/2);
   // translate(myX-4, myY+5);
   // rotate(a);  
   // textAlign(CENTER,CENTER);
   // text("5", -5, -5);
   // popMatrix();
   // a+=.01;
   if(num == 5){
     correctNumber = true;
   }
   if(myX >= 400 && correctNumber != true){
     bubbleColor = color(255, 0, 0);
   }else if(changemyY == false){
     bubbleColor = color(255, 255, 255);
   }
 }
 void show(){
   fill(bubbleColor);
   ellipse(myX, myY, widthX, heightY);
 }
void reshape(){
  if(myX < 400 && myX > 225){
    rightSquish = true;
    if(myY < 90 && hitBottom == false){
      myY = myY + 1;//
      heightY = heightY - 1;
    //heightY = 20;
    }else if(myY == 90){
      hitBottom = true;
    }
    if(hitBottom == true && myY > 80 && myX < 300){
      myY = myY - 1;
      heightY = heightY + 1;
    }
  }else{
    rightSquish = false;
  }
   
   if(myX < 200 && myX > 20){
     leftSquish = true;
     if(myY > 70 && hitBottomSecond == false){
       myY = myY - 1;//
       heightY = heightY - 1;
     }else if(myY == 70){
       hitBottomSecond = true;
     }
     if(hitBottomSecond == true && myY < 80 && myX < 100){
       myY = myY + 1;
       heightY = heightY + 1;
     }
   }else{
     leftSquish = false;
   }
   if(myX < 70){
     secondRow = false;
   }
 }
  void arenaSquisher(){
   fill(grayColor);
   // LEFT SQUISH
   if(rightSquish == true){
   rect(300, blockY, 100, 5);
   fill(0);
   rect(300,50,100,5);
     if(blockY < 70 && squishBall == false){
       blockY = blockY + 2;
       if(blockY == 70){
       squishBall = true;
       }
     }
     if(myX < 250 && squishBall == true){
       blockY = blockY - 2;
     }
   }
   // RIGHT SQUISH
   if(leftSquish == true){
   fill(0);
   rect(100,100,100,5);
   fill(grayColor);
   rect(100, blockY + 50, 100, 5);
     if(blockY + 50 > 87 && squishBallSecond == false){
       blockY = blockY - 2;
       if(blockY + 50 <= 87){
       squishBallSecond = true;
       }
     }
     if(myX < 100 && squishBallSecond == true){
       if(blockY != 50){
       blockY = blockY + 2;
       }
     }
   }
   fill(grayColor);
   if(myX == 50){
     reboot = true;
     myX = 50;
     secondRow = false;
   }
   if(secondRow == false){
    thirdRow = true;
  }
 }
}
 void topRowDispenser(){
   fill(0);
   noStroke();
   rect(25,0,50,20);
   fill(100);
   triangle(80,5,80,60,20,32.5);
   rect(10,15, 50, 35);
   fill(117, 127, 145);
   rect(15,20,40,7);
   rect(15,35,40,7);
   fill(255,0,0);
   rect(17.5,22.5,35,2);
   rect(17.5,37.5,35,2);
   fill(255);
   rect(18 + myXFirst,21,2,4.5);
   rect(30 + myXSecond,36,2,4.5);
   myXFirst = myXFirst + shiftmyXFirst;
   if(myXFirst < 0){
     shiftmyXFirst = 1;
   }else if(myXFirst > 35){
     shiftmyXFirst = -1;
   }
   myXSecond = myXSecond + shiftmyXSecond;
   if(myXSecond < -12){
     shiftmyXSecond = 1;
   }else if(myXSecond > 23){
     shiftmyXSecond = -1;
   }
   
   fill(grayColor);
 }
