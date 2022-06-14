boolean happy = true;
void setup() {
  size(800, 800); 
  fill(243, 113, 85);
  noStroke();
  //Draw head and body
  rectMode(CENTER);
  ellipse(width/2, 100, 100, 100);
  rect(width/2, 150, 25, 50);
  fill(83, 6, 121);
  rect(width/2, 275, 150, 200);
  //Draw shirt arms
  rect(width/2 - 75, 200, 150, 50);
  rect(width/2 + 75, 200, 150, 50);
  //Draw arms
  fill(243, 113, 85);
  rect(width/2 - 187.5, 200, 75, 25);
  rect(width/2 + 187.5, 200, 75, 25);
  //draw pants
  fill(13, 20, 207);
  rect(width/2 - 50, 450, 50, 150);
  rect(width/2 + 50, 450, 50, 150);
  //draw eyes
  fill(255, 255, 255);
  ellipse(width/2 + 25, 75, 25, 25);
  ellipse(width/2 - 25, 75, 25, 25);
  fill(0, 0, 0);
  ellipse(width/2 + 25, 75, 10, 10);
  ellipse(width/2 - 25, 75, 10, 10);
}

void draw() {

  if (happy) {
    fill(243, 113, 85);
    arc(width/2, 135, 51, 51, PI, 2*PI);
    fill(0, 0, 0);
    arc(width/2, 115, 50, 50, 0, PI);
  } else {
    fill(243, 113, 85);
    arc(width/2, 115, 51, 51, 0, PI);
    fill(0, 0, 0);
    arc(width/2, 135, 50, 50, PI, 2*PI);
  }
}

void mouseClicked() {
  happy = !happy;
}
