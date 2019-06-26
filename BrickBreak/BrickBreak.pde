Ball ball;
Paddle paddle;
ScoreBoard score;
Brick[][] bricks;

void setup() {
  size(550, 600);
  paddle = new Paddle(width/2, height -20, 100, 10);
  ball = new Ball(width/2, (height -20) + paddle.paddleHeight/2, 2, 2, 25);
  score = new ScoreBoard(width/2, 25);
  bricks = new Brick[4][6];
  int xPos, yPos;

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      yPos = 25 + (50 * i);

      if (i % 2 == 0) {
        xPos = 50 + (100 * j);
      } else {
        xPos = 100 * j;
      }

      bricks[i][j] = new Brick(xPos, yPos, 100, 50);
    }
  }
}

void draw() {
  background(126);


  if (!ball.inPlay) {
    ball.position.x = paddle.position.x;
  } else {
    ball.move();
  }

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      bricks[i][j].show();
      if (bricks[i][j].active && ball.checkBrick(bricks[i][j])) {
        score.addPoint();
        ball.speed.y *= -1;
        bricks[i][j].breakBrick();
      }
    }
  }
  ball.show();
  paddle.show();
  score.show();
  ball.checkBounce();

  if (ball.checkPaddle(paddle)) {
    ball.position.y = height - ((ball.diameter/2 + paddle.paddleHeight/2) + 20);
    ball.speed.y *= -1;
  }



  if (ball.checkOffScreen()) {
    noLoop();
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddle.moveLeft();
  } else if (keyCode == RIGHT) {
    paddle.moveRight();
  } else if (keyCode == 32 && !ball.inPlay) {
    ball.inPlay = true;
  }
}
