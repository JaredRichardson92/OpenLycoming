
//My classes
Ball myBall;
Paddle myPaddle;
Brick[] bricks = new Brick[0];
PowerUp myPowerUp;

//My variables
int ballSize = 10;
int paddleHeight = 10;
int paddleWidth = 75;
int brickHeight = 20;
int brickWidth = 50;
int numBrickRows = 10;
int initialBallSpeed = 1;

void setup() {
  size(400, 400);
  for (int i = 0; i < numBrickRows; i++) {
    int y = brickHeight/2 + i*brickHeight;
    int offset = 0;
    if (i%2 == 0) {
      offset = brickWidth/2;
    }

    // Fill rows
    for (int j = offset; j< width+brickWidth/2; j+= brickWidth) {
      bricks = (Brick[]) append(bricks, new Brick(j, y, brickWidth, brickHeight));
    }
  }
  myPaddle = new Paddle(paddleWidth, paddleHeight);
}

void draw() {
  background(255);

  // Draw bricks
  for (int i = 0; i < bricks.length; i++) {
    if (bricks[i] != null) {
      bricks[i].show();
    }
  }

  //draw ball
  if (myBall != null) {
    myBall.show();
    myBall.update();
    if(myBall.yPos > height){
     myBall = null; 
    }
  }

  //draw paddle
  myPaddle.show();

  //test ball touching paddle
  if (myBall != null && myPaddle.impact(myBall)) {
    myBall.bounce();
  }

  if (myBall != null) {
    for (int i = 0; i < bricks.length; i++) {
      if (bricks[i] != null && bricks[i].impact(myBall)) {
        myBall.bounce();
        if (random(1.0) <= .9 && myPowerUp == null) {
          myPowerUp = new PowerUp(bricks[i].xPos, bricks[i].yPos, brickWidth/2, brickHeight/2);
        }
        bricks[i] = null;
      }
    }
  }

  // powerup code
  if (myPowerUp != null) {
    myPowerUp.show();
    myPowerUp.update();
    
    //check for power up collection
    if(myPaddle.checkPower(myPowerUp)){
      myPowerUp.applyPower(myPaddle,myBall);
      myPowerUp = null;
    }
    
    //remove powerup if it falls off screen
    if(myPowerUp != null && myPowerUp.yPos >= height ){
     myPowerUp = null; 
    }   
  }  
}

void mouseClicked() {
  if (myBall == null) {
    myBall = new Ball(myPaddle.xPos, height - paddleHeight - ballSize/2, ballSize, 1, -1);
  }
}
