/*
grid encoding
 0 - blank space
 1-8 - number of bombs touching
 10 - bomb
 */

int grid[][];
int numbBombs = 10;
boolean gameOver;
void setup() {
  gameOver = false;
  size(500, 500);
  grid = new int[10][10];

  int bombCount = 0;

  while (bombCount < numbBombs) {
    int row, col;
    row = int(random(10));
    col = int(random(10));

    if (grid[col][row] == 0) {
      grid[col][row] = 10;
      bombCount++;
    }
  }

  fillNumbers();

  for (int col = 0; col < 10; col++) {
    for (int row = 0; row < 10; row++) {
      //if (grid[col][row] == 10) {
      //  fill(255, 0, 0);
      //} else {
        fill(0, 255, 0);
      //}
      rect(col * 50, row * 50, 50, 50);
    }
  }
}

void draw() {
}

void mouseClicked() {

  int col = mouseX/50;
  int row = mouseY/50;

  if (mouseButton == RIGHT && !gameOver && grid[col][row] != -1) {
    if (grid[col][row] <= 10) {    
      fill(200, 0, 100);
      rect(col*50, row*50, 50, 50);
      grid[col][row] += 20;
    } else {
      fill(0, 255, 0);
      rect(col*50, row*50, 50, 50);
      grid[col][row] -= 20;
    }

    if (checkWinner()) {
      gameOver = true;
      textSize(75);
      fill(255);
      text("YOU WIN!!!", 40, 300);
    }
  } else if (grid[col][row] < 20 && grid[col][row] != -1) {
    if (grid[col][row] != 10 && !gameOver) {
      revealSquare(col, row);
    } else if (grid[col][row]== 10) {
      fill(255, 0, 0);
      rect(col*50, row*50, 50, 50);
      gameOver();
    }
  }
}

void gameOver() {
  gameOver = true;
  textSize(75);
  fill(0);
  text("GAME OVER!", 25, 300);
}

void keyPressed() {
  if (keyCode == 32) {
    setup();
  }

  if (keyCode == UP) {
    numbBombs++;
    setup();
  } else if (keyCode == DOWN) {
    numbBombs--;
    setup();
  }
}

void fillNumbers() {
  for (int col = 0; col < 10; col++) {
    for (int row = 0; row < 10; row++) {
      if (grid[col][row] == 0) {
        grid[col][row] = checkTop(col, row) + checkBottom(col, row) + checkLeft(col, row) + checkRight(col, row);
      }
    }
  }
}

int checkTop(int col, int row) {
  if (row == 0) {
    return 0;
  }

  if (grid[col][row - 1] == 10) {
    return 1;
  } else {
    return 0;
  }
}

int checkBottom(int col, int row) {
  if (row == 9) {
    return 0;
  }

  if (grid[col][row+1] == 10) {
    return 1;
  } else {
    return 0;
  }
}

int checkLeft(int col, int row) {
  //check if left most column
  if (col == 0) {
    return 0;
  }
  int count = 0;

  //check square up and to left
  if (row != 0) {
    if (grid[col - 1][row - 1] ==10) {
      count++;
    }
  }

  //check square directly left
  if (grid[col - 1][row] == 10) {
    count++;
  }

  //check square down and to left
  if (row != 9) {
    if (grid[col - 1][row + 1] ==10) {
      count++;
    }
  }

  return count;
}

int checkRight(int col, int row) {
  //check for right most column 
  if (col == 9) {
    return 0;
  }

  int count = 0;
  //check up and to the right
  if (row != 0) {
    if (grid[col + 1][row - 1] == 10) {
      count++;
    }
  }

  //check directly right
  if (grid[col + 1][row] == 10) {
    count++;
  }

  //check down and to the right
  if (row != 9) {
    if (grid[col + 1][row + 1] == 10) {
      count++;
    }
  }

  return count;
}

boolean checkWinner() {
  int markedBombs = 0;

  for (int col = 0; col < 10; col++) {
    for (int row = 0; row < 10; row++) {
      if (grid[col][row] == 30) {
        markedBombs++;
      }
    }
  }

  return markedBombs == numbBombs;
}

void cascade(int col, int row) {
  //check up
  if (row != 0) {
    if (grid[col][row-1] == 0) {
      revealSquare(col, row-1);
    }
  }
  //check down
  if (row != 9) {
    if (grid[col][row+1] == 0) {
      revealSquare(col, row+1);
    }
  }
  //check left
  if (col != 0) {
    if (grid[col-1][row] == 0) {
      revealSquare(col-1, row);
    }
  }
  //check right
  if (col != 9) {
    if (grid[col+1][row] == 0) {
      revealSquare(col+1, row);
    }
  }
}

void revealSquare(int col, int row) {
  fill(0, 0, 255);
  rect(col * 50, row * 50, 50, 50);
  fill(255);
  if (grid[col][row] != 0) {
    textSize(20);
    text(str(grid[col][row]), col*50 +20, row*50 + 40);
  }
  if (grid[col][row] == 0) {
    grid[col][row] = -1;
    cascade(col, row);
  } else {
    grid[col][row] = -1;
  }
}
