{ x, y }

thread t0 {
    r0 <- 1;
    r1 <- (2 + r0) * 3;
    y := r2;
    while (r0 > 4) {
      r0 <:- x;
      r1 <- (r0 + 5);
      x.[*\yellowemph{store}*](_rx, r1);
      y = x.[*\yellowemph{load}*](_rx)
    };
}

exists x = 1, y = 2, 0:r1 = 3,