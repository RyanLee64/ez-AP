#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include "stringops.h"

char *createstr(char *input){
    int len = strlen(input);
    char *allocd_ptr = (char*)malloc(sizeof(char)*len+1);
    sprintf(allocd_ptr, "%s", input);
    return allocd_ptr;
}

char *concatstrs(const char *str1, const char *str2){
    int len = strlen(str1) + strlen(str2);
    char *allocd_ptr = (char *)malloc(sizeof(char)*len+sizeof(char));
    sprintf(allocd_ptr,"%s%s",str1, str2);
    return allocd_ptr;
}

//Return a null-terminated string of length 2 with index 0 equal to the char
char charatstr(const char *str1, int i ){
    int len = strlen(str1);
    //in the event the user passs an out of bounds integer
    if(i > len){
        errno = EPERM;
        perror("invalid index:");
        return 0;  
    } 
    else
    {
        char c = *(str1+i);
        return c;
    }
}

char checkstreq(const char *str1, const char *str2){
    if(strcmp(str1,str2) != 0) return 0;
    else return 1;
}

char *readstr(){
    /*artificial limit of 16k impossed on reading time permitting add 
    more flexible read support*/
    char buf[16384];
    memset(buf,0,sizeof(buf));
    fgets(buf, 16384, stdin);
    char *ret = (char *)malloc(strlen(buf)+1);
    strcpy(ret, buf);
    return ret;

}

void writestr(const char *towrite){
    //implement later if time permits
}




