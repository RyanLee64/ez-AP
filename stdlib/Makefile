CC := gcc
CFLAGS := -Wall -g
OBJS := printbig.o stringops.o socketops.o
DEPENDS := stringops.h socketops.h

# clean up object files cause we don't need them
ezaplib-main.a: clean stdlib 
	ar -cq ezaplib-main.a *.o
	rm -f *.o

ezaplib.a: stdlib
	ar -cq ezaplib.a *.o
	rm -f *.o

stdlib: $(OBJS)

%.o: %.c $(DEPENDS)
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o *.a

all: clean ezaplib-main.a

.PHONY: clean all
