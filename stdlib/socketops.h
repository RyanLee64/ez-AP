#ifndef _SOCKETOPS_H_
#define _SOCKETOPS_H_

struct sock{
    char conn_type;
    int  port_num;
    int  fd;
};

void ez_create(struct sock *);



#endif