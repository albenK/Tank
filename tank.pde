/*
AUTHOR: ALBEN KALAMBUKADU
PROJECT NAME: SIMPLE TANK
DATE CREATED: 12/29/2015
*/

//boolean angleChange;
float xPosOfTank,yPosOfTank,x,y,angle,yIncrement;
float wdth,hght,ySpeed,xSpeed,xIncrement,scale; // all of these values never change, so we can make them final.
void setup()
{
  size(500,500);
  angle = (3*PI)/2;
  scale = 50;
  xPosOfTank = width/2;
  yPosOfTank = height/2;
  wdth = 50;
  hght = 50;
  //angleChange = true;
  yIncrement = yPosOfTank;
  ySpeed = 5;
  xSpeed = 5;
  xIncrement = yIncrement; // xIncrement stays this value forever...
}

void draw()
{
  background(255);
//  if(angleChange)
//  {
    
    x = (cos(angle)*scale)+xIncrement;
    y = (sin(angle)*scale)+yIncrement;
  //}
  if(angle > 2*PI) // so the angles wont get to big.
  {
     angle = 0;
  }
  else if(angle < 0){angle = 2*PI;}
  displayTank();
}
void displayTank()
{
  rectMode(CENTER);
  noFill();
 // ellipse(xPos,yPos,scale*2,scale*2); // debugging purposes...
  //--------- tank body--------------
  fill(0,255,0); 
  rect(xPosOfTank,yPosOfTank,wdth,hght);
  // ---------tank wheels-----------
  fill(0);
  strokeWeight(10);
  line(xPosOfTank-(wdth/2)-5,yPosOfTank-(hght/2),xPosOfTank-(wdth/2)-5,yPosOfTank-(hght/4)); //top left
  line(xPosOfTank+(wdth/2)+5,yPosOfTank-(hght/2),xPosOfTank+(wdth/2)+5,yPosOfTank-(hght/4)); // top right
  line(xPosOfTank-(wdth/2)-5,yPosOfTank+(hght/4),xPosOfTank-(wdth/2)-5,yPosOfTank+(hght/2)); // bottom left
  line(xPosOfTank+(wdth/2)+5,yPosOfTank+(hght/4),xPosOfTank+(wdth/2)+5,yPosOfTank+(hght/2)); // bottom right
  //----tank cannon--------
  strokeWeight(5);
  line(xPosOfTank,yPosOfTank,x,y);
}

void keyPressed()
{
  if(keyCode == RIGHT)
  {
    //angleChange = true;
    //angle += 0.1;
    xPosOfTank += xSpeed;
    xIncrement = xPosOfTank;
  }
  else if(keyCode == LEFT)
  {
   // angleChange = true;
    //angle -= 0.1;
    xPosOfTank -= xSpeed;
    xIncrement = xPosOfTank;
  }
  else if(keyCode == UP)
  {
   // angleChange = false;
    yPosOfTank -= ySpeed;
    y -= ySpeed;
    yIncrement = yPosOfTank;
  }
  else if(keyCode == DOWN)
  {
   // angleChange = false;
    yPosOfTank += ySpeed;
    y += ySpeed;
    yIncrement = yPosOfTank;
  }
  else if(key == 'z')
  {
    angle -= 0.1; // move the cannon towards the left side.
  }
  else if(key == 'x') // move the cannon towards the right side.
  {
    angle += 0.1;
  }
}
