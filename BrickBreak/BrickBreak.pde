Ball ball;
Paddle paddle;
ScoreBoard score;

void setup() {
  size(600, 600);
  ball = new Ball(width/2, height/2, 2, 2, 25);
  paddle = new Paddle(width/2, height -20, 50, 10);
  score = new ScoreBoard(width/2, 25);
}

void draw() {
  background(126);
  ball.show();
  ball.move();
  ball.checkBounce();

  if (ball.checkPaddle(paddle)) {
    ball.position.y = height - ((ball.diameter/2 + paddle.paddleHeight/2) + 20);
    ball.speed.y *= -1;
  }

  paddle.show();


  score.show();
  ball.checkOffScreen();
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddle.moveLeft();
  } else if (keyCode == RIGHT) {
    paddle.moveRight();
  }
}
