class Brick {
  int xPos;
  int yPos;
  int bWidth;
  int bHeight;
  color c;

  Brick(int x, int y, int brickWidth, int brickHeight) {
    xPos = x;
    yPos = y;
    bWidth = brickWidth;
    bHeight = brickHeight;
    c = color(random(255), random(255), random(255));
  }

  void show() {
    rectMode(CENTER);
    fill(c);
    rect(xPos, yPos, bWidth, bHeight);
  }

  boolean impact(Ball b) {
    if (xPos - bWidth/2 <= b.xPos &&
      b.xPos <= xPos + bWidth/2 &&
      yPos + bHeight/2 >  b.yPos - b.ballSize/2) {
      return true;
    }
    return false;
  }
  
}
