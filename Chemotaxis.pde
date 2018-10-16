 Bacteria top;
 Bacteria [] squares;
 boolean askForNumber = true;
 boolean noWait = false;
 int textFader = 0;
 boolean reboot = false;
 int shift = 2;
 int num = (int)(Math.random()*3)+3;
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
 boolean crushed = false;
 int barX = 40;
 int barShift = -2;
 boolean cueSquares = false;
 int randomSpeed = 1;
 int numberCounter = 0;
 boolean closeArena = false;
 int rcx = 510;
 int lcx = -10;
 int rayShade = 0;
 boolean riseSquares = false;
 boolean rise = false;
 int textShade = -50;
 float textY = 100;
 
 /*TABLE OF CONTENTS
  setup
  draw
  class Bacteria
  rise
  run
  squareGlide
  squareShow
  runCheck
  runCheckSecondRow
  crusher
  numberGenerator
  show
  reshape
  arenaSquisher
  topRowDispenser
  rayBeam
  thankYou
 */
 
 void setup()   
 {     
 size(500,500);
 frameRate(100);
 top = new Bacteria();
 squares = new Bacteria[10];
  for(int i = 0; i < squares.length;i++)
  {
    squares[i] = new Bacteria();
  }
 }   
 void draw()   
 {    
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
   if(closeArena == true && numberCounter > 800){
     arenaClosers();
     for(int i = 0; i < squares.length;i++){
       rise = true;
       squares[i].rise();
     }
     if(riseSquares == true){
       thankYou();
     }
   }
   if(thirdRow == true){
     top.runCheckSecondRow();
   }
   top.run();
   top.runCheck();
   top.show();
   top.numberGenerator();
   topRowDispenser();
   if(cueSquares == true)
     for(int i = 0; i < squares.length;i++){
         squares[i].squareShow();
         squares[i].squareGlide();
     }
   }
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
   int myX, myY, myXSquare, randomSquareSize, myRandomSpeed, squareSize;
   double increaser, myYSquare;
   Bacteria(){
   myX = 250;
   myY = 200;
   myXSquare = 400;
   myYSquare = 170;
   randomSquareSize = (int)(Math.random()*3)+1;
   myRandomSpeed = (int)(Math.random()*4)+1;
   increaser = (Math.random()*1)+0.5;
 }
 
 void rise(){
   if(riseSquares == true){
     for(int i = 0; i < squares.length;i++){
     squares[i].myYSquare = squares[i].myYSquare - squares[i].increaser;
     }
   }
 }
 
 void run(){
   myX = myX + shift;
   if(myX < 50 && reboot == false){
     shift = 2;
   }else if(myX > 460 && reboot == false){
     shift = -4;
   }else if(reboot == true){
     shift = 1;
   }
   if(askForNumber == true){
     fill(255);
     textSize(14);
     text("Waiting for number...",350,15);
     if(noWait == true){
       fill(0,0,0,textFader);
       textFader = textFader + 2;
       rect(350,0, 150,20);
     }
   }
 }
 
 void squareGlide(){
   if(myXSquare > 200){
     myXSquare = myXSquare - myRandomSpeed;
   }
   for(int i = 0; i < squares.length; i++){
     if(squares[i].myXSquare == 250 && squares[i].squareSize == 10){
       squares[i].myRandomSpeed = 0;
       myXSquare = 250-5;
       closeArena = true;
     }else if(squares[i].myXSquare == 250 && squares[i].squareSize == 20){
       squares[i].myRandomSpeed = 0;
       myXSquare = 250-20;
       closeArena = true;
     }else if(squares[i].myXSquare == 250 && squares[i].squareSize == 30){
       squares[i].myRandomSpeed = 0;
       myXSquare = 250-15;
       closeArena = true;
     }
   }
   if(closeArena == true){
     numberCounter = numberCounter + 1;
   }
 }
 void squareShow(){
   if(rise == false){
     myYSquare = 170;
     if(randomSquareSize == 1){
       squareSize = 10;
       myYSquare = myYSquare + 20;
     }else if(randomSquareSize == 2){
       squareSize = 20;
       myYSquare = myYSquare + 5;
     }else if(randomSquareSize == 3){
       squareSize = 30;
     }
   }
   fill(0,0,255,100);
   rect(myXSquare, (int)myYSquare, squareSize, squareSize);
 }
 void runCheck(){
   if(correctNumber == true && myX >= 460){
     changemyY = true;
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
       noWait = true;
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
      fill(0);
      rect(crusherX, 155,50,5); // black filler
      fill(105);
      triangle(crusherX, 150, crusherX + 50, 150, crusherX + 25, 170); // nozzle
      fill(115);
      triangle(crusherX + 5, 150 + 3, crusherX + 45, 150 + 3, crusherX + 25, 170); // nozzle
      fill(110);
      rect(crusherX, 160, 50, 40); // base of crusher
      fill(200);
      rect(crusherX+5, 175,40,10); // gray bar
      fill(0,255,0);
      rect(crusherX+7.5, 177.5,36,5);
      crusherX = crusherX + crusherShift;
      fill(255);
      rect(crusherX + barX, 175, 5, 10);
      if(crusherX > 410){
        crusherShift = -2;
      }
      if(crusherX <= 410){
        crusherShift = 0;
        crushEm = true;
      }
      if(crushed == true){ // green/white bar
        barX = barX + barShift;
        if(barX > 7){
          barShift = -1;
        }
        if(barX <= 7){
          barShift = 0;
          cueSquares = true;
        }
      }
    }
    if(crushEm == true){
      shiftY = 1;
      if((int)myY == 180){
        shiftY = 0;
        crushed = true;
      }
    }
    fill(grayColor);
   }
   
 void numberGenerator(){
   fill(0);
   if(myX == 60){
     num = (int)(Math.random()*3)+3;
   }
   text(num, myX-4, myY+5);
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
      myY = myY + 1;
      heightY = heightY - 1;
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
    if(myY > 71 && hitBottomSecond == false){
      myY = myY - 1;
      heightY = heightY - 1;
    }else if(myY == 71){
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
   fill(96);
   triangle(80,5,80,60,20,32.5);
   fill(100);
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
 
 void arenaClosers(){
   fill(255);
   if(rcx > 275){
     rcx = rcx - 1;
   }
   if(lcx < 225){
     lcx = lcx + 1;
   }
   if(rcx == 275 && lcx == 225){
     rayBeam();
   }
   // RIGHT SIDE
   fill(255);
   rect(rcx,235, 5, 30);// White sqishers
   rect(rcx,335-50, 5, 30);
   rect(rcx,335, 5, 30);
   rect(rcx,385, 5, 30);
   fill(0);
   rect(rcx+5,250, 250, 5);// Black trail filler
   rect(rcx+5,335-35, 250, 5);
   rect(rcx+5,335+15, 250, 5);
   rect(rcx+5,385+15, 250, 5);
   // LEFT SIDE
   fill(255);
   rect(lcx,235, 5, 30);
   rect(lcx,335-50, 5, 30);
   rect(lcx,335, 5, 30);
   rect(lcx,385, 5, 30);
   fill(0);
   rect(lcx,250, -250, 5);// Black trail filler
   rect(lcx,335-35, -250, 5);
   rect(lcx,335+15, -250, 5);
   rect(lcx,385+15, -250, 5);
   fill(grayColor);
 }
 
 void rayBeam(){
   fill(255, 241, 96, rayShade);
   if(rayShade < 200){
     rayShade = rayShade + 1;
   }
   if(rayShade > 100){
     riseSquares = true;
   }
   rect(232, 0, 41, 500);
   fill(255, 241, 96, rayShade - 150);
   rect(240, 0, 25, 500);
 }
 
 void thankYou(){
   fill(255,255,255, textShade);
   if(textShade < 255){
     textShade = textShade + 1;
   }
   if(textY < 250){
     textY = textY + 0.8;
   }
   textSize(50);
   text("Thank You!", 110, textY);
 }
