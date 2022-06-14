class Ball {
  int xPos;
  int yPos;
  int ballSize;
  int xSpeed;
  int ySpeed; 


  Ball(int x, int y, int size, int initialXspeed, int initialYspeed) {
    xPos = x;
    yPos = y;
    ballSize = size;
    xSpeed = initialXspeed;
    ySpeed = initialYspeed;
  }

  void show() {
    fill(0);
    ellipse(xPos, yPos, ballSize, ballSize);
  }
  
  void update(){
    xPos += xSpeed;
    yPos += ySpeed;
    
    //check for side bounce
    if(xPos < 0 || xPos > width){
     xSpeed *= -1; 
    }
    
    //check for top bounce
    if(yPos < 0){
     bounce(); 
    }
  }
  
  void bounce(){
    ySpeed *= -1;
  }
  
  
}
