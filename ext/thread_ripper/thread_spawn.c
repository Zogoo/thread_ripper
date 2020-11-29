#include "thread_spawn.h"

void *say_hello(void)
{
    pthread_t thr;
    thr = pthread_self();
    printf("Hello world, from thread number: %ld\n", (long) thr);
    return (void *) thr;
}

void spawn_thread(void) {
    pthread_t t1;
    void *res;
    int s;

    s = pthread_create(&t1, NULL, say_hello, void);

    if (s != 0)
    {
        rb_raise(rb_eNoMemError, "Unable to creat thread");
    }

    printf("Spawning new threads \n");

    s = pthread_join(t1, &res);

    if (s != 0)
    {
        rb_raise(rb_eNoMemError, "Could not join threads");
    }

    printf("Thread finished: %ld \n", (long)res);
}

void Init_thread_ripper(void){
    VALUE cThreadRipper;
    cThreadRipper = rb_define_module("ThreadRipper");
    rb_define_module_function(cThreadRipper, "spawn", spawn_thread, -1);
}
