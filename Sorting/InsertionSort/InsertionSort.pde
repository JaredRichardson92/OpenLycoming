int N = 480;
int delay = 1;
int i, j, w, h, value, shifts, comps;
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
  h = (height - 10) / N;
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
  thread("insertionSort");
}

void draw() {
  background(255);
  for (int k = 0; k < N; k++) {
    fill(setColor(k));
    rect(k*w, height, w, -(arr[k] * h + h));
  }
  fill(0);
  text("Number of Comparisons: " + comps, 10, 10);
  text("Number of Shifts: " + shifts, 10, 25);
  text("Total Operations: " + (shifts + comps), 10, 40);
}

void swap(int i, int swap) {
  int temp = arr[i];
  arr[i] = arr[swap];
  arr[swap] = temp;
}

color setColor(int x) {
  if (done){
    return color(0,255,0);
  } else if (x == i) {
    return color(0, 0, 255);
  } else if ( x == j+1) {
    return color(245, 236, 66);
  } else {
    return color(125);
  }
}

void insertionSort() {
  for (i = 1; i < N; i++) {
    value = arr[i];
    j = i - 1;
    redraw();
    delay(delay);
    comps++;
    while (j >= 0 && arr[j] > value) {
      arr[j+1] = arr[j];
      arr[j] = value;
      j--;
      shifts++;
      comps++;
      redraw();
      delay(delay);
    }
    arr[j+1] = value;
    shifts++;
  }
  done = true;
  delay(10);
  redraw();
}
