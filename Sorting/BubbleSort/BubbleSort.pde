int N = 15;
int delay = 1;
int i, j, w, h, comps, swaps;
int[] arr;
boolean done;

void setup() {
  // set up
  //fullScreen();
  size(600, 300);
  background(255);
  noLoop();
  // define variables
  i = 0;
  j = N - 1;
  w = width / N;
  h = (height - 10) / N;
  arr = new int[N];
  comps = 0;
  swaps = 0;
  done = false;
  // fill array
  for (int i = 0; i < N; i++) {
    arr[i] = i;
  }
  //shuffle values
  for (int i = 0; i < N; i++) {
    swap(i, int(random(N)));
  }
  thread("bubbleSort");
}

void draw() {
  background(255);
  for (int k = 0; k < N; k++) {
    fill(setColor(k));
    rect(k*w, height, w, -(arr[k] * h + h));
  }
  fill(0);
  text("Number of Comparisons: " + comps, 10, 10);
  text("Number of Swaps: " + swaps, 10, 25);
  text("Total Operations: " + (swaps + comps), 10, 40);
}

void swap(int i, int swap) {
  int temp = arr[i];
  arr[i] = arr[swap];
  arr[swap] = temp;
}

color setColor(int x) {
  if ((x == arr[x] && x > j) || done) {
    return color(0, 255, 0);
  } else if (x == i) {
    return color(0, 0, 255);
  } else if ( x == i+1) {
    return color(245, 236, 66);
  } else {
    return color(125);
  }
}

void bubbleSort() {
  while (j > 0) {
    for (i = 0; i < j; i++) {
      redraw();
      delay(delay);
      comps++;
      //compare i with value one to right
      if (arr[i] > arr[i+1]) {
        swap(i, i+1);
        swaps++;
        redraw();
        delay(delay);
      }
    }
    j--;
  }
  done = true;
  delay(10);
  redraw();
}
