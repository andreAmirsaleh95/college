#include <stdio.h>
#include <stdlib.h>

void nop(){
}

void function(int a, int b, int c) {
    char buffer1[5];
    char buffer2[10];
    int *ret;

    nop();
    ret = (int*)(buffer1 + 24);
    (*ret) += 8;
}

void main() {
    int x;

    x = 0;
    function(1,2,3);
    x = 1;
    printf("%d\n",x);
}
