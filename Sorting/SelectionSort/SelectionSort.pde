int N = 960;
int delay = 0;
int i, j, w, h, min, shifts, comps;
int[] arr;
boolean done;

void setup() {
  // set up
  fullScreen();
  //size(600, 300);
  background(255);
  noLoop();
  // define variables
  w = width / N;
  h = (height-10) / N;
  arr = new int[N];
  shifts = 0;
  comps = 0;
  done = false;
  // fill array
  for (int i = 0; i < N; i++) {
    arr[i] = i;
  }
  //shuffle values
  for (int i = 0; i < N; i++) {
    swap(i, int(random(N)));
  }
  thread("SelSort");
}

void draw() {
  background(255);
  for (int k = 0; k < N; k++) {
    //fill(125);
    fill(setColor(k));
    rect(k*w, height, w, -(arr[k] * h + h));
  }
  fill(0);
  text("Number of Comparisons: " + comps, 10, 10);
  text("Number of Shifts: " + shifts, 10, 25);
  text("Total Operations: " + (shifts + comps), 10, 40);
}

void swap(int value, int swap) {
  int temp = arr[value];
  arr[value] = arr[swap];
  arr[swap] = temp;
}

color setColor(int x) {
  if (done || x < i) {
    return color(0, 255, 0);
  } else if (x == i) {
    return color(0, 0, 255);
  } else if (x == j) {
    return color(245, 236, 66);
  } else if (x == min){
    return color(236,29,35);
  } else {
    return color(125);
  }
}

void SelSort() {
  for (i = 0; i < N - 1; i++) {
    min =  i;
    for (j = i+1; j < N; j++) {
      comps++;
      delay(delay);
      redraw();
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    if (i != min) {
      shifts++;
      swap(i, min);
      delay(delay);
      redraw();
    }
  }  
  done = true;
  delay(10);
  redraw();
}
