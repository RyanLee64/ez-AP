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
    struct addrinfo hints, *res;

    // first, load up address structs with getaddrinfo():

    memset(&hints, 0, sizeof hints);
    hints.ai_family = AF_UNSPEC;  // use IPv4 or IPv6, whichever
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_flags = AI_PASSIVE;     // fill in my IP for me
    int port = bare_socket->port_num;
    char port_str[7];
    sprintf(port_str, "%d", port);
    if(getaddrinfo(NULL, port_str, &hints, &res) != 0){
        die("invalid port passed");
    }
    // bind it to the port we passed in to getaddrinfo():
    if(bind(fd, res->ai_addr, res->ai_addrlen) < 0) die("bind failed");

}