Ball ball;
Paddle paddle;
ScoreBoard score;

void setup() {
  size(600, 600);
  ball = new Ball(width/2, height/2, 2, 5, 50);
  paddle = new Paddle(25, height/2, 10, 100);
  score = new ScoreBoard(width/2, 25);
}

void draw() {
  background(126);
  if (ball.inPlay) {
    ball.show();
    ball.move();
    ball.checkBounce();

    paddle.show();
    if (ball.checkPaddle(paddle))
      score.addPoint();
    score.show();
    ball.checkOffScreen();
  } else {
   textAlign(CENTER);
   textSize(75);
   fill(255,0,0);
   text("GAME OVER!", width/2, height/2);
   text("Final Score: " + score.score, width/2, height/2 +100);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    paddle.moveUp();
  } else if (keyCode == DOWN) {
    paddle.moveDown();
  }
}
