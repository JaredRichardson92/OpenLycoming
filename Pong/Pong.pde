PongBall ball;
Paddle paddle;
ScoreBoard score;
boolean manual = false;

void setup() {
  //size(600, 600);
  fullScreen();
  for (int i = 0; i < 10; i++) {
    ball = new PongBall(int(random(width/2) + width/2), int(random(height - 20) + 10), 50, int(random(10)+1), int(random(10)+1));
  }

  paddle = new Paddle(20, height/2, 10, 150);

  score = new ScoreBoard(width/2, 50);

  textAlign(CENTER);
  textSize(50);
}

void draw() {
  background(128);
  frameRate(120);
  fill(0);
  //text("User Name: Lyco1    Password: CodingIsFun!", width/2, height - 75);
  if (ball.inPlay) {
    ball.show();
    score.show();
    paddle.show();
    ball.move();  
    ball.checkPaddle(paddle, score);
    ball.checkOffScreen();
    if (!manual) {
      if (ball.position.x < width/2 && ball.speed.x < 0) {
        if (ball.position.y > paddle.position.y) {
          paddle.moveDown();
        } else if (ball.position.y < paddle.position.y) {
          paddle.moveUp();
        }
      }
    }
  } else {
    textAlign(CENTER);
    textSize(75);
    text("GAME OVER!", width/2, height/2);
    text("Final Score: " + score.score, width/2, height/2 + 75);
  }
}

void keyPressed() {
  if (manual) {
    if (keyCode == UP) {
      println("up");
      paddle.moveUp();
    } else if (keyCode == DOWN) {
      paddle.moveDown();
      println("down");
    }
  }
}
