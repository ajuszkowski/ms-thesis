{   int x = 1, *y; }

void thread_0(int &x, int &y) {
    L0: x = 0; //labelled statement
    int r;
    while (x * (5 + 4 / 2) % 3 == 1) {
      if (x != 0) {
        goto L0; //backward jump
      }
      if (y > 6) {
        continue; //jump to the loop entry
      }
      else if (++y > 7) {
        r = r + 10;
        break; //jump to the loop exit
      }
      else {
        goto L1; //forward jump
      }
      r = 11;
    }
    y = x + 1;
    L1: x = r; //labelled statement
}

void thread_1() {
    ...
}

exists (y == x + 1 && thread_0:r > 21)
