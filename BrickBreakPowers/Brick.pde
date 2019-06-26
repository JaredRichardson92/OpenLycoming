class Brick {
  PVector position;
  int brickHeight, brickWidth;
  color brickColor;
  boolean active;

  Brick(int x, int y, int h, int w) {
    position = new PVector(x, y);
    brickHeight = h;
    brickWidth = w;
    brickColor = color(random(255), random(255), random(255));
    active = true;
  }

  void show() {
    if (active) {
      rectMode(CENTER);
      fill(brickColor);
      rect(position.x, position.y, brickHeight, brickWidth);
    }
  }

  void breakBrick() {
    active = false;
  }


}
