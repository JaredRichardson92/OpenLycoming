int N = 480;
int delay = 2;
int i, j, w, h, value, shifts, comps, currentPivot;
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
  thread("quickSortStarter");
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
  if (done) {
    return color(0, 255, 0);
  } else if (x == currentPivot) {
    return color(0, 0, 255);
  } else if (x == i) {
    return color(255, 0, 0);
  } else if (x == j) {
    return color(245, 236, 66);
  } else {
    return color(125);
  }
}

void quickSortStarter() {

  quickSort(0, N-1);

  done = true;
  delay(20);
  redraw();
}

void quickSort(int low, int high) {
  comps++;
  if (low < high) {
    int p = partition(low, high);
    currentPivot = p;
    quickSort(low, p);
    delay(delay);
    redraw();
    quickSort(p+1, high);
    delay(delay);
    redraw();
  }
}

int partition(int low, int high) {
  int pivot = arr[int(low + (high-low)/2)];
  i = low - 1;
  j = high + 1;
  do {
    do {
      comps++;
      i++;
      delay(delay);
      redraw();
    } while (arr[i] < pivot);

    do {
      comps++;
      j--;
      delay(delay);
      redraw();
    } while (arr[j] > pivot);
    comps++;
    if ( i >= j) {
      return j;
    }
    shifts++;
    swap(i, j);
    delay(delay);
    redraw();
  } while (true);
}
