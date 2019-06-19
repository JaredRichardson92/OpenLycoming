class ScoreBoard {
  PVector position;
  int score;

  ScoreBoard(int x, int y) {
    position = new PVector(x, y);
    score = 0;
  }

  void show() {
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text(score, position.x, position.y);
  }

  void addPoint() {
    score++;
  }
}
