{ int *x = 0; }

// extern int z;

void t0(int &x, int &y) {
    L0: y = 3;
    int r0 = 1;
    y = r0 * x;
    while (++r0 > 2) {
        if (y == 4)
            break;
        if (y == 5)
            continue;
        if (r0 == 6) {
        	goto L1;
        }
        x.store(_rx, r0);
        L1: y = x.load(_rx);
    }
    if (z == 7) {
        goto L0;
    }
}

exists (x == 9 && (y == 10 || t0:r0 >= 11))