void P0(int& x, int& y) {
  int a = 0;
  // for loop
  while (x++ > y) {
    y = y - ++a;
    // call foo
    if (a > y) {
      break;
    }
  }
}


int foo(int a, int b) {
 
}