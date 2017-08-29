# Default installation prefix
PREFIX=/opt/openresty/luajit

# System's libraries directory (where binary libraries are installed)
LUA_LIBDIR= $(PREFIX)/lib/lua/5.1

# Lua includes directory
LUA_INC= $(PREFIX)/include/luajit-2.1

# OS dependent
LIB_OPTION= -shared #for Linux

# Compilation directives
WARN= -O2 -Wall -fPIC -W -Waggregate-return -Wcast-align -Wnested-externs -Wshadow -Wwrite-strings -pedantic
INCS= -I$(LUA_INC)
CFLAGS= $(WARN) $(INCS)
CC= gcc

SRCS= trim.c
OBJS= trim.o

trim.so: $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o trim.so $(OBJS)

install:
	mkdir -p $(LUA_LIBDIR)
	cp trim.so $(LUA_LIBDIR)

clean:
	rm -f trim.so $(OBJS)

