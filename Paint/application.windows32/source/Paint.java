import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Paint extends PApplet {

/*
* Author: Jared Richardson
* Date: 7/16/2018
*
* Desc: A simple paint program for College for Kids made in Processing 3.3.7
*/

//Global Variables
int[] pallet = new int[8];
int c;
int size, shape;

public void setup() {
  
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
  rect(465, 65, size, size);
  triangle(475, 125 - PApplet.parseInt(size/2), 475 - PApplet.parseInt(size/2), 125 + PApplet.parseInt(size/2), 475 + PApplet.parseInt(size/2), 125 + PApplet.parseInt(size/2));

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

public void draw() {
  noStroke();
}

public void mouseClicked() {
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
      fill(255, 255, 255);
      rect(51, 0, 398, 398);
      break;
    }
  }
}

public void mouseDragged() {
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
      triangle(mouseX, mouseY - PApplet.parseInt(size/2), mouseX - PApplet.parseInt(size/2), mouseY + PApplet.parseInt(size/2), mouseX + PApplet.parseInt(size/2), mouseY + PApplet.parseInt(size/2));
      break;
    }
  }
}
  public void settings() {  size(500, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Paint" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
