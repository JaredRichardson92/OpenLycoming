int diameter = 75;
int xPos = diameter/2;
int yPos = diameter/2;
boolean movingLeft = false;
boolean movingDown = true;

void setup(){
  size(600,600);
}

void draw() {
  //frameRate(200);
  background(128);
  fill (0,0,255);
  stroke (255,0,0);
  strokeWeight (10);
  ellipse(xPos,yPos,diameter,diameter);
  if (movingLeft)
    xPos--;
  else
    xPos++;
  
  if(movingDown)
    yPos+=2;
  else
    yPos-=2;
  
   checkBounce();
}

void checkBounce(){
  if (xPos >= width - diameter/2)
    movingLeft = true;
  else if (xPos <= diameter/2)
    movingLeft = false;

  if (yPos <= diameter/2)
     movingDown = true;
  else if (yPos >= height - diameter/2)
   movingDown = false;
}

void mouseClicked(){
  movingLeft = !movingLeft;
}
