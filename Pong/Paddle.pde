class Paddle {
  PVector position;
  int paddleWidth, paddleHeight;
  Paddle(int x, int y, int w, int h) {
    position = new PVector(x, y);
    paddleWidth = w;
    paddleHeight = h;
  }

  void show() {
    rectMode(CENTER);
    fill(0, 255, 0);
    rect(position.x, position.y, paddleWidth, paddleHeight);
  }

  void moveUp() {
    if (position.y >= paddleHeight/2) {
      position.y -= height/100;
    }
  }

  void moveDown() {
    if (position.y <= height - paddleHeight/2) {
      position.y += height/100;
    }
  }
}
