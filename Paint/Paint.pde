/*
* Author: Jared Richardson
 * Date: 7/16/2018
 *
 * Desc: A simple paint program for College for Kids made in Processing 3.3.7
 */

//Global Variables
color[] pallet = new color[8];
color c;
int size, shape;

void setup() {
  size(500, 400);
  background(255, 255, 255);

  //Create random color pallet
  for (int i = 0; i < 8; i++) {    
    c = color(random(255), random(255), random(255));
    fill(c);
    pallet[i] = c;
    rect(0, i*50, 50, 50);
    fill(255, 255, 255);
    rect(450, i*50, 50, 50);
  }

  //set default shape to square and size to 20
  shape = 0;
  size = 10;

  // Draw shape options
  fill(0, 0, 0);
  ellipse(475, 25, size, size);
  rectMode(CENTER);
  rect(475, 75, size, size);
  triangle(475, 125 - int(size/2), 475 - int(size/2), 125 + int(size/2), 475 + int(size/2), 125 + int(size/2));

  //Draw 4 size buttons
  for (int i = 0; i < 4; i++) {
    ellipse(475, (i*50) + 175, (i+1)*5, (i+1)*5);
  }

  //Draw clear button
  noStroke();
  fill(255, 0, 0);
  quad(455, 360, 465, 360, 495, 390, 485, 390);
  quad(455, 390, 465, 390, 495, 360, 485, 360);
}

void draw() {
  noStroke();
}

void mouseClicked() {
  //Determins if on left or right side of UI
  if (mouseX > 0 && mouseX <= 50) {
    c = pallet[mouseY / 50];
  } else if (mouseX >= 450 && mouseX < 500) {
    switch(mouseY / 50) {
    case 0:
      shape = 0;
      break;
    case 1:
      shape =1;
      break;
    case 2:
      shape = 2;
      break;
    case 3:
      size = 5;
      break;
    case 4:
      size = 10;
      break;
    case 5:
      size = 15;
      break;
    case 6:
      size = 20;
      break;
    case 7:
      rectMode(CORNER);
      fill(255, 255, 255);
      rect(51, 0, 398, 398);
      break;
    }
  }
}

void mouseDragged() {
  if (mouseX > 50 && mouseX < 450) {
    fill(c);
    switch(shape) {
    case 0:
      ellipse(mouseX, mouseY, size, size);
      break;
    case 1:
      rect(mouseX, mouseY, size, size);
      break;
    case 2:
      triangle(mouseX, mouseY - int(size/2), mouseX - int(size/2), mouseY + int(size/2), mouseX + int(size/2), mouseY + int(size/2));
      break;
    }
  }
}
