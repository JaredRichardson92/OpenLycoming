/*
* Author: Jared Richardson
 * Date: 7/17/2018
 * Purpose: A tic-tac-toe game for use in
 *          Intro to Computer Programming
 *          College for Kids and Teens 2018
 */
boolean xTurn = true;
boolean gameWon = false;
char[] grid = new char[9];
int turns = 0;

void setup() {
  size(600, 600);
  background(255,255,255);
  

  //Draw board
  strokeWeight(5);
  line(200, 0, 200, 600);
  line(400, 0, 400, 600);
  line(0, 200, 600, 200);
  line(0, 400, 600, 400);

  for (int i = 0; i < 9; i++) {
    grid[i] = ' ';
  }
  //drawO(9);
}

void draw() {
}

void drawX(int loc) {
  int remainder = loc%3;
  int div = int((loc-1)/3);
  //print(remainder);
  int x=0, y=0;
  // Determins X value
  switch(remainder) {
  case 0:
    x=420;
    break;
  case 1:
    x=20;
    break;
  case 2:
    x=220;
    break;
  }
  // Determins Y Value
  switch(div) {
  case 0:
    y=20;
    break;
  case 1:
    y=220;
    break;
  case 2:
    y=420;
    break;
  }

  stroke(255, 0, 0);
  strokeWeight(15);
  line(x, y, x+160, y+160);
  line(x+160, y, x, y+160);
}

void drawO(int loc) {
  int remainder = loc%3;
  int div = int((loc-1)/3);
  int x=0, y=0;

  //Determine X positon
  switch(remainder) {
  case 0:
    x=500;
    break;
  case 1:
    x=100;
    break;
  case 2:
    x=300;
    break;
  }

  //Determine Y positon
  switch(div) {
  case 0:
    y=100;
    break;
  case 1:
    y=300;
    break;
  case 2:
    y=500;
    break;
  }

  noFill();
  stroke(0, 0, 255);
  strokeWeight(10);
  ellipse(x, y, 180, 180);
}

boolean checkWinner() {

  //check for horizontal victory
  for (int i = 0; i < 7; i += 3) {
    if (grid[i] != ' ') {
      if (grid[i] == grid[i+1] && grid[i] == grid[i+2]) {
        return true;
      }
    }
  }

  //check for vertical victory
  for (int i = 0; i < 3; i++) {
    if (grid[i] != ' ' && grid[i] == grid[i+3] && grid[i] == grid[i+6]) {
      return true;
    }
  }

  //check diag
  if (grid[0] == grid[4] && grid[0] == grid[8] && grid[0] != ' ') {
    return true;
  }

  if (grid[2] == grid[4] && grid[2] == grid[6] && grid[2] != ' ') {
    return true;
  }


  return false;
}

void mouseClicked() {

  if (gameWon) {
    turns=0;
    rectMode(CORNER);
    fill(255, 255, 255);
    noStroke();
    rect(0,0,600,600);
    stroke(0,0,0);
    strokeWeight(5);
    line(200, 0, 200, 600);
    line(400, 0, 400, 600);
    line(0, 200, 600, 200);
    line(0, 400, 600, 400);

    xTurn = true;

    for (int i = 0; i < 9; i++) {
      grid[i] = ' ';
    }
    gameWon=false;
    return;
  }

  int row=0, col=0;
  //determine col
  if (mouseX < 200) {
    col=1;
  } else if (mouseX>=200 && mouseX <400) {
    col=2;
  } else {
    col=3;
  }
  //determine row
  if (mouseY < 200) {
    row=1;
  } else if (mouseY>=200 && mouseY <400) {
    row=2;
  } else {
    row=3;
  }
  //println("Row is " + row, "Col is " + col, "square is " + (3*(row-1)+col));

  int square = (3*(row-1)+col);

  if (grid[square-1] == ' ' && !checkWinner()) {
    turns++;
    if (xTurn) {
      drawX(square);
      grid[square-1] = 'X';
    } else {  
      drawO(square);
      grid[square-1] = 'O';
    }
    if (checkWinner()) {
      println("There is a winner!");
      gameWon = true;
    }
    if(turns == 9 && !checkWinner()){
     println("The game is a Tie");
     gameWon = true;
    }
    xTurn = !xTurn;
  }
}
