class PowerUp {
  int xPos;
  int yPos;
  int pWidth;
  int pHeight;
  int powerUpValue;
  color c;

  PowerUp(int x, int y, int powerWidth, int powerHeight) {
    xPos = x;
    yPos = y;
    pWidth = powerWidth;
    pHeight = powerHeight;
    powerUpValue = int(random(6)) + 1; 
    c = color(random(255), random(255), random(255));
  }

  void show() {
    fill(c);
    ellipse(xPos, yPos, pWidth, pHeight);
  }

  void update() {
    c = color(random(255), random(255), random(255));
    yPos = yPos + 2;
  }

  void applyPower(Paddle p, Ball b) {
    switch (powerUpValue) {
    case 1:
      p.pWidth += 5;
      break;
    case 2:
      p.pWidth -= 5;
      break;
    case 3:
      b.ballSize += 5;
      break;
    case 4:
      b.ballSize -= 5;
      break;
    case 5:
      b.xSpeed *= 2;
      b.ySpeed *= 2;
      break;
    case 6:
      b.xSpeed = int(b.xSpeed*.5) + 1;
      b.ySpeed = int(b.ySpeed*.5) + 1;
      break;
    }
  }
}
