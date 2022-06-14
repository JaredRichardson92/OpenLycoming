class Paddle{
 int pWidth;
 int pHeight;
 int xPos;
 int yPos;
 color c;
 
 Paddle(int paddleWidth, int paddleHeight){
   pWidth = paddleWidth;
   pHeight = paddleHeight;
   c = color(random(255),random(255),random(255));
   yPos = height - pHeight/2;
 }
 
 void show(){
  rectMode(CENTER);
  xPos = mouseX;
  fill(c);
  rect(xPos,yPos, pWidth, pHeight);
 }  
 
 boolean impact(Ball b){
   if(xPos - pWidth/2 <= b.xPos &&
   b.xPos <= xPos + pWidth/2 &&
   yPos - pHeight/2 < b.yPos + b.ballSize/2){
    return true;
  }   
   return false;
 }
 
  boolean checkPower(PowerUp p){
   if(xPos - pWidth/2 <= p.xPos &&
   p.xPos <= xPos + pWidth/2 &&
   yPos - pHeight/2 < p.yPos + p.pHeight/2){
    return true;
  }   
   return false;
 }
}
