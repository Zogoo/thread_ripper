#include "thread_ripper.h"

void *say_hello(void *args)
{
    char *msg = (char *) args;
    pthread_t thr;
    thr = pthread_self();
    printf("%s, from thread number: %ld\n", msg, (long) thr);
    return (void *) thr;
}

static VALUE spawn_thread(VALUE self)
{
    pthread_t t1;
    void *res;
    int s;

    s = pthread_create(&t1, NULL, say_hello, "Hello thread");

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

    return rb_int_new((long) res);
}

void Init_thread_ripper(void){
    VALUE cThreadRipper = rb_define_module("ThreadRipper");
    VALUE cThreadSpawn = rb_define_class_under(cThreadRipper, "ThreadSpawn", rb_cObject);
    rb_define_singleton_method(cThreadSpawn, "create_thread", spawn_thread, 0);
}
