{ int flag0 = 0, flag1 = 0, turn = 0; }

void P0() {
    while (true) {
      int a = 1, b = 0;
      flag0.store(memory_order_relaxed, a);
      f1 = flag1.load(memory_order_relaxed);
      while (f1 == 1) {
        t1 = turn.load(memory_order_relaxed);
        if (t1 != 0) {
          flag0.store(memory_order_relaxed, b);
          t1 = turn.load(memory_order_relaxed);
          while (t1 != 0)
            t1 = turn.load(memory_order_relaxed);
          flag0.store(memory_order_relaxed, a);
        }
      }
    }
}

void P1() {
    ...
}
exists (turn == 10)
