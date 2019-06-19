class Ball {
  PVector position, speed;
  int diameter;
  boolean inPlay;

  Ball(int x, int y, int xSpeed, int ySpeed, int size) {
    position = new PVector();
    speed = new PVector(xSpeed, ySpeed);
    position.x = x;
    position.y = y;
    diameter = size;
    inPlay = false;
  }

  void show() {
    fill(255, 0, 255);
    ellipse(position.x, position.y, diameter, diameter);
  }

  void move() {
    position.add(speed);
  }

  void checkBounce() {
    // Check Left and Right Sides
    if (position.x < diameter/2 || position.x > width - diameter/2)
      speed.x *= -1;

    //Check the Top and Bottom
    if (position.y < diameter/2 /* || position.y > height - diameter/2 */) //commented out section that checks bottom
      speed.y *= -1;
  }

  boolean checkOffScreen() {
    if (position.y > height + diameter/2) {
      inPlay = false;
      return true;
    }
    return false;
  }

  boolean checkPaddle(Paddle paddle) {
    return(checkPaddleTop(paddle) || checkPaddleBottom(paddle) || checkPaddleLeft(paddle) || checkPaddleRight(paddle));
  }

  boolean checkPaddleTop(Paddle paddle) {
    return (abs(position.y - paddle.position.y) <= paddle.paddleHeight/2 + diameter/2 &&    //Check if the ball is touching the paddle
      position.y > paddle.position.y &&                                                     //Check if the ball is above the paddle
      position.x + diameter/2 > paddle.position.x - paddle.paddleWidth/2 &&                 //Check if the ball is to the right of the left side of the paddle 
      position.x - diameter/2 < paddle.position.x + paddle.paddleWidth/2);                  //Check if the ball is to the left of the right side of the paddle
  }

  boolean checkPaddleBottom(Paddle paddle) {
    return (abs(position.y - paddle.position.y) <= paddle.paddleHeight/2 + diameter/2 &&    //Check if the ball is touching the paddle
      position.y < paddle.position.y &&                                                     //Check if the ball is below the paddle
      position.x + diameter/2 > paddle.position.x - paddle.paddleWidth/2 &&                 //Check if the ball is to the right of the left side of the paddle 
      position.x - diameter/2 < paddle.position.x + paddle.paddleWidth/2);                  //Check if the ball is to the left of the right side of the paddle
  }

  boolean checkPaddleLeft(Paddle paddle) {
    return (abs(position.x - paddle.position.x) <= paddle.paddleWidth/2 + diameter/2 &&     //Check if the ball is touching the paddle
      position.x < paddle.position.x &&                                                     //Check if the ball is on the left side of the paddle
      position.y - diameter/2 < paddle.position.y + paddle.paddleHeight/2 &&                //Check if the ball is above the bottom of the paddle
      position.y + diameter/2 > paddle.position.y - paddle.paddleHeight/2);                 //Check if the ball is below the top of the paddle
  }

  boolean checkPaddleRight(Paddle paddle) {
    return (abs(position.x - paddle.position.x) <= paddle.paddleWidth/2 + diameter/2 &&     //Check if the ball is touching the paddle
      position.x > paddle.position.x &&                                                     //Check if the ball is on the right side of the paddle
      position.y - diameter/2 < paddle.position.y + paddle.paddleHeight/2 &&                //Check if the ball is above the bottom of the paddle
      position.y + diameter/2 > paddle.position.y - paddle.paddleHeight/2);                 //Check if the ball is below the top of the paddle
  }


/*
  boolean checkBrick(Brick brick) {
    return(checkBrickTop(brick) || checkBrickBottom(brick) || checkBrickLeft(brick) || checkBrickRight(brick));
  }

  boolean checkBrickTop(Brick brick) {
    return (abs(position.y - brick.position.y) <= brick.brickHeight/2 + diameter/2 &&    //Check if the ball is touching the brick
      position.y > brick.position.y &&                                                     //Check if the ball is above the brick
      position.x + diameter/2 > brick.position.x - brick.brickWidth/2 &&                 //Check if the ball is to the right of the left side of the brick 
      position.x - diameter/2 < brick.position.x + brick.brickWidth/2);                  //Check if the ball is to the left of the right side of the brick
  }

  boolean checkBrickBottom(Brick brick) {
    return (abs(position.y - brick.position.y) <= brick.brickHeight/2 + diameter/2 &&    //Check if the ball is touching the brick
      position.y < brick.position.y &&                                                     //Check if the ball is below the brick
      position.x + diameter/2 > brick.position.x - brick.brickWidth/2 &&                 //Check if the ball is to the right of the left side of the brick 
      position.x - diameter/2 < brick.position.x + brick.brickWidth/2);                  //Check if the ball is to the left of the right side of the brick
  }

  boolean checkBrickLeft(Brick brick) {
    return (abs(position.x - brick.position.x) <= brick.brickWidth/2 + diameter/2 &&     //Check if the ball is touching the brick
      position.x < brick.position.x &&                                                     //Check if the ball is on the left side of the brick
      position.y - diameter/2 < brick.position.y + brick.brickHeight/2 &&                //Check if the ball is above the bottom of the brick
      position.y + diameter/2 > brick.position.y - brick.brickHeight/2);                 //Check if the ball is below the top of the brick
  }

  boolean checkBrickRight(Brick brick) {
    return (abs(position.x - brick.position.x) <= brick.brickWidth/2 + diameter/2 &&     //Check if the ball is touching the brick
      position.x > brick.position.x &&                                                     //Check if the ball is on the right side of the brick
      position.y - diameter/2 < brick.position.y + brick.brickHeight/2 &&                //Check if the ball is above the bottom of the brick
      position.y + diameter/2 > brick.position.y - brick.brickHeight/2);                 //Check if the ball is below the top of the brick
  }
  
  */
}
