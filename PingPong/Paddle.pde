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
    fill(0, 0, 255);
    rect(position.x, position.y, paddleWidth, paddleHeight);
  }

  void moveUp() {
    if (position.y > paddleHeight/2)
      position.y -= 5;
  }

  void moveDown() {
    if (position.y < height - paddleHeight/2)
      position.y += 5;
  }
}
