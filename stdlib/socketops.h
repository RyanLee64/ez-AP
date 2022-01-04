#ifndef _SOCKETOPS_H_
#define _SOCKETOPS_H_

struct sock{
    char conn_type;
    int  port_num;
    int  fd;
};

void ez_create(struct sock *);

void ez_connect(struct sock *unconnected_socket, char *address, int port);

void ez_send(struct sock *connected_socket, const char *message);

char *ez_recv(struct sock *connected_socket);

void ez_close(struct sock *connected_socket);

#endif