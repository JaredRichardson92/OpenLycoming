class ScoreBoard {
  PVector position;
  int score;

  ScoreBoard(int x, int y) {
    position = new PVector(x, y);
    score = 0;
  }
  
  void show(){
    textAlign(CENTER);
    fill(0);
    textSize(50);
    text(score, position.x, position.y);
  }
  
  void addPoint(){
   score++; 
  }
  
}
