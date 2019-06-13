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
    inPlay = true;
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
    if (position.x > width - diameter/2)
      speed.x *= -1;

    //Check the Top and Bottom
    if (position.y < diameter/2 || position.y > height - diameter/2)
      speed.y *= -1;
  }

  boolean checkPaddle(Paddle paddle) {
    if ((position.x - paddle.position.x) <= paddle.paddleWidth/2 + diameter/2 && 
      position.y < paddle.position.y + paddle.paddleHeight/2 && 
      position.y > paddle.position.y - paddle.paddleHeight/2) {
      speed.x *= -1;
      return true;
    }
    return false;
  }
  
  void checkOffScreen(){
   if(position.x < -1 * diameter/2)
     inPlay = false;
  }
}
