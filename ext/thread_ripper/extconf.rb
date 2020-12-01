require "mkmf"

CONFIG["optflags"] = "-pthread"

create_makefile("thread_ripper/thread_ripper");