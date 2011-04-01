#ifndef _BAR_H
#define _BAR_H
typedef struct bar {
    int m;
} bar;

bar * bar_new(void);
void bar_free(bar * b);
void bar_hello(const bar * b);
#endif
