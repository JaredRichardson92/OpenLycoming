class PongBall {  
  int diameter;
  PVector position, speed;
  boolean inPlay;


  PongBall(int x, int y, int size, int xSpeed, int ySpeed) {
    position = new PVector();
    speed = new PVector();
    position.x = x;
    position.y = y;
    speed.x = xSpeed;
    speed.y = ySpeed;
    diameter = size;
    inPlay = true;
  }

  void show() {
    fill(0, 0, 255);
    ellipse(position.x, position.y, diameter, diameter);
  }

  void move() {
    position.add(speed);
    checkBounce();
  }

  void checkBounce() {

    if (position.x >= width - diameter/2 /* || position.x <= diameter/2 */)
      speed.x = -1 * speed.x;

    if (position.y <= diameter/2 || position.y >= height - diameter/2)
      speed.y = -1 * speed.y;
  }

  void checkPaddle(Paddle paddle, ScoreBoard score) {
    if ((position.x - paddle.position.x) <= paddle.paddleWidth/2 + diameter/2 && 
      position.y < paddle.position.y + paddle.paddleHeight/2 && 
      position.y > paddle.position.y - paddle.paddleHeight/2) {
      speed.x = -1 * speed.x;
      score.addPoint();
    }
  }
  
  void checkOffScreen(){
   if(position.x < -(diameter/2))
     inPlay = false;
  }
}
