{ x, y }

thread t0 {
    r0 [*\yellowemph{<-}*] 1;
    r1 [*\yellowemph{<-}*] (2 + r0) * 3;
    y [*\yellowemph{:=}*] r2;
    while (r0 > 4) {
      r0 [*\yellowemph{<:-}*] x;
      r1 [*\yellowemph{<-}*] (r0 + 5);
      x.store(_rx, r1);
      y [*\yellowemph{=}*] x.load(_rx)
    };
}

exists x = 1, y = 2, 0:r1 = 3,