CC := gcc
CFLAGS := -Wall -g
OBJS := printbig.o
DEPENDS := 

# clean up object files cause we don't need them
ezaplib-main.a: stdlib 
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

all: clean ezaplib.a

.PHONY: clean all
