#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include "socketops.h"

static void die(const char *s) { perror(s); exit(1); }

void ez_create(struct sock *bare_socket){
    int fd;
    if ((fd = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
	    die("failure to create a socket file descriptor");
    }
    printf("socket bound to file descriptor %d\n", fd);
    bare_socket->fd = fd;
}