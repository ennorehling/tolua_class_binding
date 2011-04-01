#include "bar.h"
#include <stdio.h>
#include <stdlib.h>

static int i = 0;

bar * bar_new(void) {
    bar * b = (bar *)malloc(sizeof(bar));
    b->m = i++;
    return b;
}
void bar_free(bar * b) {
    --i;
    free(b);
}
void bar_hello(const bar * b) {
    printf("hello bar %d\n", b->m);
}
