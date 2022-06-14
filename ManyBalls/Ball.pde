class PongBall {  
  int diameter;
  PVector location, speed;


  PongBall(int x, int y, int size, int xSpeed, int ySpeed) {
    location = new PVector();
    speed = new PVector();
    location.x = x;
    location.y = y;
    speed.x = xSpeed;
    speed.y = ySpeed;
    diameter = size;
  }

  void show() {
    ellipse(location.x, location.y, diameter, diameter);
  }

  void move() {
    location.add(speed);

    checkBounce();
  }

  void checkBounce() {
    
    if (location.x >= width - diameter/2 || location.x <= diameter/2)
     speed.x = -1 * speed.x;
     
     if (location.y <= diameter/2 || location.y >= height - diameter/2)
     speed.y = -1 * speed.y;     
  }

  void checkBallCollision(PongBall otherBall) {
    if(distance(getX(), getY(), otherBall.getX(), otherBall.getY()) < diameter + otherBall.diameter){
      int magnitude = int(mag(speed.x, speed.y) + mag(otherBall.getX(), otherBall.getY()));
      
    }
  }
  
  void setSpeed(int xSpeed, int ySpeed){
    speed.x = xSpeed;
    speed.y = ySpeed;
  }
  
  int getX(){
    return int(location.x);
  }
  
  int getY(){
    return int(location.y);
  }

  float distance(int x1, int y1, int x2, int y2) {
    return sqrt(sq(x1-x2)+sq(y1-y2));
  }
}
