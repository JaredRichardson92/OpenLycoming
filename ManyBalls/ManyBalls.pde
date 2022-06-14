PongBall balls[] = new PongBall[50];

void setup(){
  //size(600,600);
  fullScreen();
  for(int i = 0; i < 50; i++){
   balls[i] = new PongBall(int(random(width)),int(random(height)),int(random(50)+10),int(random(5)+1),int(random(5)+1));
  }
}

void draw(){
  background(128);
  for(int i = 0; i < 50; i++){
   balls[i].show();
   balls[i].move();
  }
}
